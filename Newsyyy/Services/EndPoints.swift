//
//  EndPoints.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation

enum EndPoints {
    case TopHeadlinesByCountry(country: String)
    case TopHeadlinesByCategory(category: String, country: String)
    case TopHeadlinesBySource(sources: String)
}

extension EndPoints {
    func url() -> URL {
        let baseUrl: String = "\(Constants.BaseURL.DEV.rawValue)/top-headlines?"
        
        switch self {
        case .TopHeadlinesByCategory(let category, let country):
            let url = "\(baseUrl)country=\(country)&category=\(category)"
            return URL(string: url)!
        case .TopHeadlinesByCountry(let country):
            let url = "\(baseUrl)country=\(country)"
            return URL(string: url)!
        case .TopHeadlinesBySource(let sources):
            let url = "\(baseUrl)sources=\(sources)"
            return URL(string: url)!
        }
    }
}