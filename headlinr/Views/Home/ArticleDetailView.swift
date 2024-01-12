import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        if let url = URL(string: article.url ?? "") {
            WKWebViewRepresentable(url: url)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("URL not available")
        }
    }
}

#Preview {
    ArticleDetailView(article: Article.dummyData.first!)
}
