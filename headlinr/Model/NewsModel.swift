import Foundation

struct NewsModel: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable, Equatable {
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, description: String?
    let image: String?
    let date: Date?
    
    private enum CodingKeys: String, CodingKey {
        case author, url, source, title, description, image, date
    }
}

extension Article {
    static var dummyData: [Article] {
        [
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            .init(author: "Aya Elamroussi",
                  url: "https://www.cnn.com/2023/08/31/weather/florida-tropical-storm-idalia-damage-thursday/index.html",
                  source: "CNN",
                  title: "Tropical Storm Idalia threatens the Carolinas with treacherous rain and flooding after pounding Florida and damaging thousands of homes - CNN",
                  description: "Some communities across Florida’s west coast battered by Idalia’s deluge and ferocious winds endured a “life-changing event,” an official says, after the strongest hurricane to make landfall in the Big Bend region in at least 125 years delivered record water",
                  image: "https://media.cnn.com/api/v1/images/stellar/prod/230830201349-29-idalia-steinhatchee-0830.jpg?c=16x9&q=w_800,c_fill",
                  date: Date()
                 ),
            
        ]
    }
}
