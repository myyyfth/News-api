//
//  NewsViewModel.swift
//  NewsAPI
//
//  Created by febian eldriano on 20/04/21.
//

import Foundation
import SwiftyJSON

class NewsViewodel: ObservableObject {
    @Published var data = [News]()
    
    init() {
        let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=1788ab17daa44c789e21cae60683f689" // ini langkah pertama  untuk pengambilan API
        
        let session = URLSession(configuration: .default)  // langkah kedua
        session.dataTask(with: URL(string: url)!) { ( data, _, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            let items = json["articles"].array!
            
            for i in items {
                let title = i["title"].stringValue
                let image = i["url"].stringValue
                let description = i["description"].stringValue
                
                DispatchQueue.main.async {
                    self.data.append(News(title: title, image: image, description: description))
                }
            }
        }.resume()
    }
}
