//
//  SelectCountryViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import Combine

class SelectCountryViewModel: BaseViewModel, ObservableObject {
    @Published var selectedCountry: Country?
    
    let dataStore = DataStore.shared
}
