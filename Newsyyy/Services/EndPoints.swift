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
    private func url() -> URL {
        let baseUrl: String = "\(Constants.BaseURL.DEV.rawValue)/top-headlines?pageSize=10&"
        
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
    
    func urlRequest() -> URLRequest {
        let url = self.url()
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(Constants.Keys.API_KEY.rawValue, forHTTPHeaderField: "X-Api-Key")
        urlRequest.cachePolicy = .useProtocolCachePolicy
        
        return urlRequest
    }
}
