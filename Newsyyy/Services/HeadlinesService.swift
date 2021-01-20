//
//  HeadlinesService.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation
import Combine

class HeadlinesService {
    static let shared = HeadlinesService()
    private var task: AnyCancellable?
}

extension HeadlinesService {
    func fetchHeadlines(byCountry country: String) -> AnyPublisher<[Article]?, Error> {
        let urlRequest = EndPoints.TopHeadlinesByCountry(country: country).urlRequest()
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .map(\.articles)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchHeadlines(bySources sources: String) -> AnyPublisher<[Article]?, Error> {
        let urlRequest = EndPoints.TopHeadlinesBySource(sources: sources).urlRequest()
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .map(\.articles)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
