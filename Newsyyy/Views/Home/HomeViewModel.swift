//
//  HomeViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Combine

class HomeViewModel: BaseViewModel, ObservableObject {
    @Published var articlesFeaturedByCountry: [Article] = []
    @Published var articlesFeaturedBySource: [Article] = []
    @Published var sources: [Source] = []
    @Published var allArticlesEmpty: Bool = true
    @Published var sourcesAreEmpty: Bool = true
    @Published var loading: Bool = false
    @Published var errorMessage: String?
    
    var dataStore = DataStore.shared
    private var subscriptions = Set<AnyCancellable>()
}

// MARK: Network requests
extension HomeViewModel {
    func fetchArticlesByCountry() {
        let countryCode = dataStore.getCountry().code
        HeadlinesService.shared.fetchHeadlines(byCountry: countryCode)
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
        let sourceCode = dataStore.getSource()
        
        HeadlinesService.shared.fetchHeadlines(bySources: sourceCode)
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
        let countryCode = dataStore.getCountry().code
        let languageCode = dataStore.getLanguage().code
        
        SourcesService.shared.fetchSources(byCountry: countryCode, language: languageCode)
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
