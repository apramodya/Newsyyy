//
//  SettingsViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import Combine

class SettingsViewModel: BaseViewModel, ObservableObject {
    @Published var selectedCountry: Country = .USA
    @Published var selectedSource: String = ""
    @Published var selectedSourceId: String = ""
    @Published var selectedLanguage: Language = .English
    
    private let dataStore = DataStore.shared
}

// MARK: Fetch user settings
extension SettingsViewModel {
    func updateUserSettings() {
        selectedCountry = dataStore.getCountry()
        selectedSource = dataStore.getSourceName()
        selectedSourceId = dataStore.getSourceCode()
        selectedLanguage = dataStore.getLanguage()
    }
}

// MARK: Update user settings
extension SettingsViewModel {
    func updateCountry(_ country: Country) {
        selectedCountry = country
        dataStore.setCountry(country)
    }
    
    func updateSource(_ sourceName: String, _ sourceId: String) {
        selectedSource = sourceName
        selectedSourceId = sourceId
        dataStore.setSourceName(sourceName)
        dataStore.setSourceCode(sourceId)
    }
    
    func updateLanguage(_ language: Language) {
        selectedLanguage = language
        dataStore.setLanguage(language)
    }
}
