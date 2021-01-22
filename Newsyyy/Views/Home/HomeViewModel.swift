//
//  HomeViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var articlesFeaturedByCountry: [Article] = []
    @Published var articlesFeaturedBySource: [Article] = []
    @Published var sources: [Source] = []
    @Published var allArticlesEmpty: Bool = true
    @Published var sourcesAreEmpty: Bool = true
    @Published var loading: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchArticlesByCountry() {
        HeadlinesService.shared.fetchHeadlines(byCountry: "us")
            .sink(receiveCompletion: { completion in
                self.loading = false
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { (articles) in
                if let articles = articles {
                    self.allArticlesEmpty = false
                    self.articlesFeaturedByCountry = articles
                        .filter({!$0.authorLabel.hasPrefix("http")})
                }
            })
            .store(in: &subscriptions)
    }
    
    func fetchArticlesBySource() {
        HeadlinesService.shared.fetchHeadlines(bySources: "bbc-news")
            .sink(receiveCompletion: { completion in
                self.loading = false
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { (articles) in
                if let articles = articles {
                    self.allArticlesEmpty = false
                    self.articlesFeaturedBySource = articles
                        .filter({!$0.authorLabel.hasPrefix("http")})
                }
            })
            .store(in: &subscriptions)
    }
    
    func fetchSources() {
        SourcesService.shared.fetchSources(byCountry: "us")
            .sink(receiveCompletion: { completion in
                self.loading = false
                
                switch completion {
                case .failure(let error):
                    if let error = error as? APIError {
                        switch error {
                        case .badRequest(let message, let code):
                            print(message)
                            print(code)
                        }
                    }

                case .finished:
                    break
                }
            }, receiveValue: { (sources) in
                if let sources = sources {
                    self.sourcesAreEmpty = false
                    let randomSources = sources.shuffled().prefix(12)
                    self.sources = Array(randomSources)
                }
            })
            .store(in: &subscriptions)
    }
}
