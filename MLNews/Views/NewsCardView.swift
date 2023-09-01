//
//  NewsCardView.swift
//  MLNews
//
//  Created by xavier on 31/08/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsCardView: View {
    
    var news: ArticleModel
    let vm = NewsCardViewModel()
    
    var body: some View {
            VStack(alignment: .leading) {
                if let newsUrl = URL(string: news.newsUrl ?? "")  {
                    Link(destination: newsUrl) {
                        if let imageUrl = news.imageUrl {
                            WebImage(url: URL(string: imageUrl))
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image("placeholder")
                                .resizable()
                                .scaledToFit()
                        }

                    }
                }
                Text(news.title ?? "")
                    .font(.headline)
                    .bold()
                    .padding(.leading)
                

                        
            
                Text(news.category ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.secondary, lineWidth: 0.5)
                    )
                    .padding(.leading)
            }
            .padding(.bottom)
        }
}

struct NewsCardView_Previews: PreviewProvider {
    
    static let news =
    ArticleModel(title: "Hurricane Idalia slams into Florida and Georgia: Live Updates - CNN", description: "Hurricane Idalia is now a Category 1 storm as it travels into Georgia from northern Florida, lashing the Southeast with heavy rain and sustained winds of 75 mph. Follow here for live updates.", newsUrl: "https://www.cnn.com/us/live-news/hurricane-idalia-path-florida-08-30-23/index.html", imageUrl: "https://cdn.cnn.com/cnnnext/dam/assets/230830091727-05-idalia-tarpon-springs-0830-super-tease.jpg")
    
    
    static var previews: some View {
        NewsCardView(news: news)
    }
}
