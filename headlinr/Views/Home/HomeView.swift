import SwiftUI
import WebKit

struct HomeView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
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
                        NavigationLink(destination: ArticleDetailView(article: item)) {
                            ArticleView(isLoading: viewModel.isLoading, article: item)
                        }
                    }
                    if sizeClass == .regular {
                        ArticleDetailView(article: viewModel.isLoading ? Article.dummyData.first! : viewModel.articles.first!)
                    }
                }
            }
            .navigationTitle("Headlinr")
            .task {
                loadArticlesIfNeeded()
            }
        }
    }
    
    private func loadArticlesIfNeeded() {
        guard !hasLoadedArticles else {
            return
        }
        
        viewModel.getArticles()
        hasLoadedArticles = true
    }
}

#Preview {
    HomeView()
}
