//
//  News.Detail.swift
//  NewsAPI
//
//  Created by febian eldriano on 20/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct News_Detail: View {
    let news : News
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                WebImage(url: URL(string: news.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                VStack (alignment: .leading, spacing: 20){
                    Text(news.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(news.description)
                        .font(.body)
                }.padding()
            }
        }
    }
}

struct News_Detail_Previews: PreviewProvider {
    static var previews: some View {
        News_Detail(news: News(id: UUID(), title: "", image: "", description: ""))
    }
}
