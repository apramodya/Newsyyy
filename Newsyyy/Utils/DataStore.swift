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
        case SourceCode
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
    func setSourceName(_ source: String) {
        userDefaults.set(source, forKey: DataStoreProperty.Source.rawValue)
    }
    
    func setSourceCode(_ source: String) {
        userDefaults.set(source, forKey: DataStoreProperty.SourceCode.rawValue)
    }
    
    func getSourceName() -> String {
        guard
            let source = userDefaults.string(forKey: DataStoreProperty.Source.rawValue)
        else {
            return ""
        }
        
        return source
    }
    
    func getSourceCode() -> String {
        guard
            let source = userDefaults.string(forKey: DataStoreProperty.SourceCode.rawValue)
        else {
            return ""
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
