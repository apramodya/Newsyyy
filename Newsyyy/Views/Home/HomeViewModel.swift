//
//  HomeViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import Combine

class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    func fetchArticlesByCountry() {
        HeadlinesService.shared.fetchHeadlines(byCountry: "us")
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            }, receiveValue: { (articles) in
                if let articles = articles {
                    self.articles = articles
                        .filter({!$0.authorLabel.hasPrefix("http")})
                }
            })
            .store(in: &subscriptions)
    }
}
