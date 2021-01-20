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
    func fetchSources(byCountry country: String) -> AnyPublisher<[Source]?, Error> {
        let urlRequest = EndPoints.Sources(country: country).urlRequest()
        
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: SourcesResponse.self, decoder: JSONDecoder())
            .map(\.sources)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
