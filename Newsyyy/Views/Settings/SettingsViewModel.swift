//
//  SettingsViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import Combine

class SettingsViewModel: BaseViewModel, ObservableObject {
    @Published var selectedCountry: String = ""
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
