//
//  HomeViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Combine
import SwiftUI

class HomeViewModel: BaseViewModel, ObservableObject {
    @Published var articlesFeaturedByCountry: [Article] = []
    @Published var articlesFeaturedBySource: [Article] = []
    @Published var sources: [Source] = []
    @Published var allArticlesEmpty: Bool = true
    @Published var sourcesAreEmpty: Bool = true
    @Published var loading: Bool = false
    @Published var errorMessage: String?
    
    private var subscriptions = Set<AnyCancellable>()
}

// MARK: Network requests
extension HomeViewModel {
    func fetchArticlesByCountry() {
        HeadlinesService.shared.fetchHeadlines(byCountry: "us")
            .sink(receiveCompletion: { [self] completion in
                self.loading = false
                switch completion {
                case .failure(let error):
                    errorMessage = handleAPIError(for: error)
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
            .sink(receiveCompletion: { [self] completion in
                self.loading = false
                switch completion {
                case .failure(let error):
                    errorMessage = handleAPIError(for: error)
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
            .sink(receiveCompletion: { [self] completion in
                self.loading = false
                
                switch completion {
                case .failure(let error):
                    errorMessage = handleAPIError(for: error)
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
