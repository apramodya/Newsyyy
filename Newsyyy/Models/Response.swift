//
//  Response.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation

struct Response: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}
