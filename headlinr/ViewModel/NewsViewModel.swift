import Combine
import Foundation

protocol NewsViewModel {
    func getArticles()
    var isLoading: Bool { get }
}  

class NewsViewModelImpl: ObservableObject, NewsViewModel {

    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    var isLoading: Bool {
        state == .loading
    }
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getArticles)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content:  self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        self.cancellables.insert(cancellable)
        
    }
    
}
