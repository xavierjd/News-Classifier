//
//  NewsListViewModel.swift
//  MLNews
//
//  Created by xavier on 31/08/23.
//

import Foundation

@MainActor
class NewsListViewModel: ObservableObject {
    
    @Published var news: NewsModel? = nil
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchNews() async {
        do {
            self.news = try await networkService.getData()
            
        } catch let error{
            print(error.localizedDescription)
        }
    }
}
