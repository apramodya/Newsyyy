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
        let url = EndPoints.TopHeadlinesByCountry(country: country).url()
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(Constants.Keys.API_KEY.rawValue, forHTTPHeaderField: "X-Api-Key")
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: Response.self, decoder: JSONDecoder())
            .map(\.articles)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
