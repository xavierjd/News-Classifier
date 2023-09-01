//
//  MLNewsApp.swift
//  MLNews
//
//  Created by xavier on 31/08/23.
//

import SwiftUI

@main
struct MLNewsApp: App {
    
    let networkService =  NetworkService()
    
    var body: some Scene {
        WindowGroup {
            NewsListView(networkService: networkService)
        }
    }
}
