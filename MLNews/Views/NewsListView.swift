//
//  ContentView.swift
//  MLNews
//
//  Created by xavier on 31/08/23.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject private var newsListVM: NewsListViewModel
    
    init(networkService: NetworkService) {
        _newsListVM = StateObject(wrappedValue: NewsListViewModel(networkService: networkService))
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    if let newsList = newsListVM.news?.articles {
                        ForEach(newsList, id: \.id ) { news in
                            if  news.title != nil {
                                NewsCardView(news: news)
                            }
                        }
                    }
                }                
                .navigationTitle("ML News")
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Image(systemName: "arrow.clockwise")
//                    }
//                }
                .task {
                    await newsListVM.fetchNews()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static let networkService = NetworkService()
    
    static var previews: some View {
        NewsListView(networkService: networkService)
    }
}    

