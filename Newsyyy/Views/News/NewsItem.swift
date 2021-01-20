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
                .lineLimit(3)
            
            HStack(alignment: .center) {
                if let url = article.urlToImage {
                    RemoteImage(url: url)
                        .frame(width: 100, height: 100)
                        .cornerRadius(5)
                } else {
                    Image(systemName: "photo")
                }
                
                VStack(alignment: .leading, spacing: 8, content: {
                    Text("Published by: ").bold()
                    Text(article.authorLabel)
                    Text("Published on: ").bold()
                    Text(article.publishedDateTime)
                })
            }
        }.padding(10)
        .border(Color.black, width: 1)
        .frame(width: UIScreen.main.bounds.width - 50)
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(article: Article.get())
    }
}
