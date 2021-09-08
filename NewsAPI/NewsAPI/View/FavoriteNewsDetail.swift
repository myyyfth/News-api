//
//  FavoriteNewsDetail.swift
//  NewsAPI
//
//  Created by Ahmad Miftah Syakir on 27/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavoriteNewsDetail: View {
    @Environtment(\.managedObjectContext) var managedObjectContext
    @FetchReuqest(enityt: FavoriteNewsL.enityt(), sortDescriptiors: []) var favoriteNews: FetchedRequest<FavoriteNews>
    
    let data: FavoriteNews
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                WebImage(url: URL(string: data.wrappedImage))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                VStack (alignment: .leading, spacing: 20){
                    Text(news.wrappedTittle)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(news.wrappedDesc)
                        .font(.body)
                }.padding()
            }
        }
    }
}

struct FavoriteNewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNewsDetail()
    }
}
