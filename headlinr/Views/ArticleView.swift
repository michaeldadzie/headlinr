import SwiftUI
import URLImage

struct ArticleView: View {
    
    @State var isLoading: Bool
    let article: Article
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
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
                        Text("|")
                            .foregroundColor(.gray)
                            .font(.system(size: 10, weight: .bold))
                        Text(article.author ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                    } else {
                        //
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
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            } else {
                PlaceHolderImageView()
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading: false, article: Article.dummyData.first!)
            .previewLayout(.sizeThatFits)
    }
}
