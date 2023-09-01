import Combine
import Foundation


protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsModel, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsModel, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError {_ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<NewsModel, APIError> in
//                print(String(data: data, encoding: .utf8)!)
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsModel.self, decoder: jsonDecoder)
                        .mapError { error in
                            print("Decoding error: \(error)")
                            return APIError.decodingError }
                        .eraseToAnyPublisher() 
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
            }
            .eraseToAnyPublisher()
    }
}
