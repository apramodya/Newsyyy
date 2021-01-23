//
//  Source.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation

struct Source: Codable, Identifiable {
    var id, name, sourceDescription: String?
    var url: String?
    var category, language, country: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case sourceDescription = "description"
        case url, category, language, country
    }
}

extension Source {
    static func get() -> Source {
        Source(id: "abc-news",
               name: "ABC News",
               sourceDescription: "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
               url: "https://abcnews.go.com",
               category: "general",
               language: "en",
               country: "us"
        )
    }
}
