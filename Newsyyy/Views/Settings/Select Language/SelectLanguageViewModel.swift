//
//  SelectLanguageViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-26.
//

import Combine

class SelectLanguageViewModel: BaseViewModel, ObservableObject {
    @Published var selectedLanguage: Language?
    
    let dataStore = DataStore.shared
}
