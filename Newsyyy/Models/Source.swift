//
//  Source.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation

struct Source: Codable {
    var id, name, sourceDescription: String?
    var url: String?
    var category, language, country: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case sourceDescription = "description"
        case url, category, language, country
    }
}
