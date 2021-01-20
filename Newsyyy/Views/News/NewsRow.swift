//
//  NewsRow.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import SwiftUI

struct NewsRow: View {
    var headerName: String
    var articles: [Article]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Text(headerName)
                .font(.headline)
                .padding(.leading, 5)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(articles) { article in
                        NewsItem(article: article)
                    }
                }
            }
            .padding(.leading, 8)
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(headerName: "Features", articles: [Article.get(), Article.get()])
    }
}
