//
//  Response.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation

struct ArticlesResponse: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

struct SourcesResponse: Decodable {
    var status: String?
    var sources: [Source]?
}

struct NewsAPIError: Decodable {
    var status: String
    var code: String
    var message: String
}

enum APIError: Error {
    case badRequest(String, String)
}
