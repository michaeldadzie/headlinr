import Foundation


protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getArticles
}

extension NewsAPI: APIBuilder {
    
    var baseUrl: URL {
        switch self {
        case .getArticles:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        switch self {
        case .getArticles:
            return "/news"
        }
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }
    
}
