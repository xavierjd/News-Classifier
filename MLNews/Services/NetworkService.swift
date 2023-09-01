//
//  NetworkService.swift
//  MLNews
//
//  Created by xavier on 31/08/23.
//

import Foundation

class NetworkService {
    func getData() async throws -> NewsModel? {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=807862f5e48040c4a57cdf0b045c76db") else {
            fatalError("Url is incorrect")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try? JSONDecoder().decode(NewsModel.self, from: data)
        return decodedData
    }
}
