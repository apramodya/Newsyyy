//
//  SelectCountryView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import SwiftUI

enum Country: String, CaseIterable, Identifiable {
    case Canada
    case France
    case GreatBritain = "Great Britain"
    case Russia
    case USA
    
    var id: Country { self }
    
    var code: String {
        switch self {
        case .Canada: return "ca"
        case .France: return "fr"
        case .GreatBritain: return "gb"
        case .Russia: return "ru"
        case .USA: return "us"
        }
    }
}

struct SelectCountryView: View {
    @ObservedObject var viewModel = SelectCountryViewModel()
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
                        HStack {
                            Text(country.rawValue)
                            Spacer()
                            if country == viewModel.selectedCountry {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Countries")
        }
        .onAppear {
            viewModel.selectedCountry = viewModel.dataStore.getCountry()
        }
    }
}
