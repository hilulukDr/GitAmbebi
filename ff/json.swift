// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

class Welcome: Codable {
    let title, link: String
    let latestArticles: [Leading]
    let categoryBlock: CategoryBlock
    
    enum CodingKeys: String, CodingKey {
        case title, link
        case latestArticles = "latest_articles"
        case categoryBlock = "category_block"
    }
    
    init(title: String, link: String, latestArticles: [Leading], categoryBlock: CategoryBlock) {
        self.title = title
        self.link = link
        self.latestArticles = latestArticles
        self.categoryBlock = categoryBlock
    }
}

class CategoryBlock: Codable {
    let link, title: String
    let leading: Leading
    let articles: [Leading]
    
    init(link: String, title: String, leading: Leading, articles: [Leading]) {
        self.link = link
        self.title = title
        self.leading = leading
        self.articles = articles
    }
}

class Leading: Codable {
    let title: String
    let introtext: JSONNull?
    let publishUp, image, link, alias: String
    let pk: Int
    
    enum CodingKeys: String, CodingKey {
        case title, introtext
        case publishUp = "publish_up"
        case image, link, alias, pk
    }
    
    init(title: String, introtext: JSONNull?, publishUp: String, image: String, link: String, alias: String, pk: Int) {
        self.title = title
        self.introtext = introtext
        self.publishUp = publishUp
        self.image = image
        self.link = link
        self.alias = alias
        self.pk = pk
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
