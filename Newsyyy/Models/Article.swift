//
//  Article.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation

struct Article: Codable, Identifiable {
    let id = UUID()
    var source: Source?
    var author: String?
    var title, articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    var authorLabel: String {
        guard let author = author, author.count > 0 else {
            return "N/A"
        }
        
        return author
    }
    
    var publishedDateTime: String {
        guard let publishedAt = publishedAt else {
            return "N/A"
        }
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy MMM d, h:mm a"

        if let date = dateFormatterGet.date(from: publishedAt) {
            return dateFormatterPrint.string(from: date)
        } else {
           return "N/A"
        }
    }
}

extension Article {
    static func get() -> Article {
        return Article(source: Source(id: nil, name: "CBS News"),
                       author: "CBS News",
                       title: "Three former presidents will attend Biden's inauguration - CBS News",
                       articleDescription: "President Trump and President Carter, who is 96, will not be attending President-elect Biden's inauguration.",
                       url: "https://www.cbsnews.com/news/biden-inauguration-former-presidents-clinton-bush-obama-attend/",
                       urlToImage: "https://cbsnews3.cbsistatic.com/hub/i/r/2021/01/18/2fa81e36-9b27-4f54-bf1d-a47bb36a12d7/thumbnail/1200x630/18149e3116a3c84c6229b37d664927bc/gettyimages-1230656627.jpg",
                       publishedAt: "2021-01-20T12:10:00Z",
                       content: "Former Presidents Bill Clinton, George W. Bush and Barack Obama are expected to attend the inauguration of President-elect Joe Biden on Wednesday, although his immediate predecessor is expected to ...")
    }
}
