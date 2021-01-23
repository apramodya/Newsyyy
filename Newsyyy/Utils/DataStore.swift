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
    func setCountry(_ country: String) {
        userDefaults.set(country, forKey: DataStoreProperty.Country.rawValue)
    }
    
    func getCountry() -> String {
        guard
            let country = userDefaults.string(forKey: DataStoreProperty.Country.rawValue)
        else {
            return "N/A"
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
    func setLanguage(_ language: String) {
        userDefaults.set(language, forKey: DataStoreProperty.Language.rawValue)
    }
    
    func getLanguage() -> String {
        guard
            let language = userDefaults.string(forKey: DataStoreProperty.Language.rawValue)
        else {
            return "N/A"
        }
        
        return language
    }
}
