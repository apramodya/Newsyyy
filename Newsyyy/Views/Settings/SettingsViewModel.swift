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
    @Published var selectedLanguage: String = ""
    
    private let dataStore = DataStore.shared
}

// MARK: Fetch user settings
extension SettingsViewModel {
    func updateUserSettings() {
        selectedCountry = dataStore.getCountry()
        selectedSource = dataStore.getSource()
        selectedLanguage = dataStore.getLanguage()
    }
}

// MARK: Update user settings
extension SettingsViewModel {
    func updateCountry(_ country: Country) {
        selectedCountry = country
        dataStore.setCountry(country)
    }
    
    func updateSource(_ source: String) {
        selectedSource = source
        dataStore.setSource(source)
    }
    
    func updateLanguage(_ language: String) {
        selectedLanguage = language
        dataStore.setLanguage(language)
    }
}
