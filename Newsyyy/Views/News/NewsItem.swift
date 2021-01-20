//
//  NewsItem.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import SwiftUI

struct NewsItem: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? "N/A")
                .font(.title3)
                .bold()
            
            HStack(alignment: .center) {
                if let url = article.urlToImage {
                    RemoteImage(url: url)
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                } else {
                    Image(systemName: "photo")
                }
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Published by: ").bold()
                    Text("\(article.author ?? "N/A")")
                    Text("Published on: ").bold()
                    Text("2020 Jan 20, 10:30 am")
                })
            }
        }.padding(10)
        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(article: Article.get())
    }
}
