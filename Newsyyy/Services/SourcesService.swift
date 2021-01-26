//
//  SourcesService.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Foundation
import Combine

class SourcesService {
    static let shared = SourcesService()
    private var task: AnyCancellable?
}

extension SourcesService {
    func fetchSources(byCountry country: String, language: String) -> AnyPublisher<[Source]?, Error> {
        let urlRequest = EndPoints.Sources(country: country, language: language).urlRequest()
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .tryMap({ (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == 200
                else {
                    do {
                        let error = try JSONDecoder().decode(NewsAPIError.self, from: data)
                        throw APIError.badRequest(error.message, error.code)
                    } catch  {
                        throw error
                    }
                }
                
                return data
            })
            .decode(type: SourcesResponse.self, decoder: JSONDecoder())
            .map(\.sources)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
