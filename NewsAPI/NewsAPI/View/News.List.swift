//
//  News.List.swift
//  NewsAPI
//
//  Created by febian eldriano on 20/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct News_List: View {
    @ObservedObject var newsViewModel = NewsViewodel()
    var body: some View {
        NavigationView{
            List(newsViewModel.data) { item in
                NavigationLink(destination: News_Detail(news: item)) {
                    HStack {
                        // jika gambar nya ada
                        if item.image != "" {
                            WebImage(url: URL(string: item.image)!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 170)
                                .background(Image("loader")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 60, height: 30))
                                .cornerRadius(10)
                        }else{
                            Image("loader")
                                .resizable()
                                .frame(width: 120, height: 170)
                                .cornerRadius(10)
                            
                            }
                        VStack (alignment: .leading, spacing: 10) {
                            Text(item.title).fontWeight(.bold)
                            Text(item.description).font(.caption)
                                .lineLimit(3)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                }
            }
            .navigationBarTitle("NewsAPI")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct News_List_Previews: PreviewProvider {
    static var previews: some View {
        News_List()
    }
}
