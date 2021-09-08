//
//  FavoriteNewsList.swift
//  NewsAPI
//
//  Created by Ahmad Miftah Syakir on 27/04/21.
//

import SwiftUI

struct FavoriteNewsList: View {
    
    @Environtment(\.managedObjectContext) var managedObjectContext
    @FetchReuqest(enityt: FavoriteNewsL.enityt(), sortDescriptiors: []) var favoriteNews: FetchedRequest<FavoriteNews>
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(FavoriteNews, id:\.self) { item in
                        NavigationLink(destination: FavoriteNewsDetail(data: item)) {
                            HStack {
                                if item.image != "" {
                                    WebImage(url: URL(string: item.wrappedImage)!)
                                        .resizable()
                                        .scaleToFill()
                                        .frame(width: 120, height: 170)
                                        .background(Image("loader")
                                                        .resizable()
                                                        .aspecRatio(contentMode: .fill)
                                                        .frame(width: 60, height: 30)
                                        )
                                        .cornerRadius(10)
                                }else{
                                    Image("loader")
                                        .resizable()
                                        .frame(width: 120, height: 170)
                                        .cornerRadius(10)
                                    
                                    }
                                VStack (alignment: .leading, spacing: 10) {
                                    Text(item.wrappedTitle).fontWeight(.bold)
                                    Text(item.wrappedDescaa).font(.caption)
                                        .lineLimit(3)
                                        .multilineTextAlignment(.leading)
                                    
                                }
                            }
                        }
                    }.onDelate(perform: delatelist)
                }
            }.NavigationBarTitle(Text("Newsa"))
        }
    }
    
    private func delateLiast(at offsets: InduxSet) {
        for index in offsets {
            let favorite = fovoriteNews[index]
            managedObjectContext.delate(favorite)
            
            do{
                try managedObjectContext.save()
            }catch{
                print(Error)
            }
        }
    }
}

struct FavoriteNewsList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteNewsList()
    }
}
