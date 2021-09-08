//
//  ContentView.swift
//  NewsAPI
//
//  Created by febian eldriano on 20/04/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NewsList()
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
        FavoriteNewsList()
            .tabItem {
                Image(systemName: "heart.fill")
                Text("Favorite")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
