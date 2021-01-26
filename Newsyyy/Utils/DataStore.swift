//
//  DataStore.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    private let userDefaults = UserDefaults.standard
    
    enum DataStoreProperty: String {
        case Country
        case Language
        case Source
    }
}

// MARK: Get/Set Country
extension DataStore {
    func setCountry(_ country: Country) {
        userDefaults.set(country.rawValue, forKey: DataStoreProperty.Country.rawValue)
    }
    
    func getCountry() -> Country {
        guard
            let _country = userDefaults.string(forKey: DataStoreProperty.Country.rawValue),
            let country = Country(rawValue: _country)
        else {
            return .USA
        }
        
        return country
    }
}

// MARK: Get/Set Source
extension DataStore {
    func setSource(_ source: String) {
        userDefaults.set(source, forKey: DataStoreProperty.Source.rawValue)
    }
    
    func getSource() -> String {
        guard
            let source = userDefaults.string(forKey: DataStoreProperty.Source.rawValue)
        else {
            return "N/A"
        }
        
        return source
    }
}

// MARK: Get/Set Language
extension DataStore {
    func setLanguage(_ language: Language) {
        userDefaults.set(language.rawValue, forKey: DataStoreProperty.Language.rawValue)
    }
    
    func getLanguage() -> Language {
        guard
            let _language = userDefaults.string(forKey: DataStoreProperty.Language.rawValue),
            let language = Language(rawValue: _language)
        else {
            return .English
        }
        
        return language
    }
}
