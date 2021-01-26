//
//  SelectSourceViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-26.
//

import Combine

class SelectSourceViewModel: BaseViewModel, ObservableObject {
    @Published var sources: [Source] = []
    @Published var sourcesAreEmpty: Bool = true
    @Published var loading: Bool = false
    @Published var errorMessage: String?
    
    private var subscriptions = Set<AnyCancellable>()
}

// MARK: Network requests
extension SelectSourceViewModel {
    func fetchSources() {
        let countryCode = DataStore.shared.getCountry().code
        let languageCode = DataStore.shared.getLanguage().code
        
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
                    self.sources = sources
                }
            })
            .store(in: &subscriptions)
    }
}
