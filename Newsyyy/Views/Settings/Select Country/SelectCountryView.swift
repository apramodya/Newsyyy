//
//  SelectCountryView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import SwiftUI

enum Country: String, CaseIterable, Identifiable {
    case Britain = "Great Britain"
    case Canada
    case France
    case Russia
    case USA
    
    var id: Country { self }
    
    var code: String {
        switch self {
        case .Britain: return "gb"
        case .Canada: return "ca"
        case .France: return "fr"
        case .Russia: return "ru"
        case .USA: return "us"
        }
    }
}

struct SelectCountryView: View {
    @State private var selectedCountry: String?
    
    var onSelection: ((Country) -> ())
    
    init(onSelection: @escaping ((Country) -> ())) {
        self.onSelection = onSelection
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedCountry) {
                ForEach(Country.allCases,
                        id: \.self) { country in
                    Button {
                        onSelection(country)
                    } label: {
                        Text(country.rawValue)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Countries")
        }
    }
}
