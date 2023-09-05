import SwiftUI
import WebKit

struct HomeView: View {
    
//    @Environment(\.openURL) var openUrl
    
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    @State private var hasLoadedArticles = false
    
    var body: some View {
        
        NavigationView {
            Group {
                switch viewModel.state {
                case .failed(let error):
                    ErrorView(error: error, handler: viewModel.getArticles)
                default:
                    List(viewModel.isLoading ? Article.dummyData : viewModel.articles) { item in
                        ArticleView(isLoading: viewModel.isLoading, article: item)
                    }
                }
            }
            .navigationTitle("Headlinr")
            .onAppear(perform: loadArticlesIfNeeded)
        }
    }

    private func loadArticlesIfNeeded() {
        guard !hasLoadedArticles else {
            return
        }
        
        viewModel.getArticles()
        hasLoadedArticles = true
    }
    
//    func load(url: String?) {
//        guard let link = url,
//              let url = URL(string: link) else { return }
//
//        openUrl(url)
//    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
