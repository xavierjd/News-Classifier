//
//  NewsModel.swift
//  MLNews
//
//  Created by xavier on 31/08/23.
//

import Foundation
import DocumentClassifier

struct NewsModel: Codable {
    let articles: [ArticleModel]
}

struct ArticleModel: Identifiable, Codable {
    var id = UUID().uuidString
    let title: String?
    let description: String?
    let newsUrl: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case newsUrl = "url"
        case imageUrl = "urlToImage"
    }
    
    var category: String? {
        guard
            let description = description,
            let title = title,
            let classification = DocumentClassifier().classify(title+description) else { return nil }
        
        return classification.prediction.category.rawValue
        
       }
}
