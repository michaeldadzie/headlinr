import SwiftUI
import URLImage
import WebKit

struct ArticleView: View {
    
    @State var isLoading: Bool
    let article: Article
    @State private var showWebView = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.primary)
                    .font(.system(size: 14, weight: .bold))
                    .lineLimit(3)
                    .truncationMode(.tail)
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
                
                HStack {
                    if let date = article.date {
                        Text(date.timeAgo())
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                    }
                    if article.author != nil {
                        /*Text("|")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .bold))
                         */
                        Text(article.author ?? "")
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                    }
                }
            }
            
            if let imgUrl = article.image,
               let url = URL(string: imgUrl) {
                
                URLImage(url, identifier: article.id.uuidString, failure: { error, _ in
                    PlaceHolderImageView()
                }) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 110, height: 110)
                .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

#Preview {
    ArticleView(isLoading: false, article: Article.dummyData.first!)
    .previewLayout(.sizeThatFits)
}
