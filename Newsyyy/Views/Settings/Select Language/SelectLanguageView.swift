//
//  SelectLanguageView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import SwiftUI

enum Language: String, CaseIterable, Identifiable {
    case English
    case Spanish
    case French
    case Italian
    
    var id: Language { self }
    
    var code: String {
        switch self {
        case .English: return "en"
        case .Spanish: return "es"
        case .French: return "fr"
        case .Italian: return "it"
        }
    }
}

struct SelectLanguageView: View {
    @ObservedObject var viewModel = SelectLanguageViewModel()
    @State private var selectedLanguage: String?
    
    var onSelection: ((Language) -> ())
    
    init(onSelection: @escaping ((Language) -> ())) {
        self.onSelection = onSelection
    }
    
    var body: some View {
        NavigationView {
            List(selection: $selectedLanguage) {
                ForEach(Language.allCases,
                        id: \.self) { language in
                    Button {
                        onSelection(language)
                    } label: {
                        HStack {
                            Text(language.rawValue)
                            Spacer()
                            if language == viewModel.selectedLanguage {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Languages")
        }
        .onAppear {
            viewModel.selectedLanguage = viewModel.dataStore.getLanguage()
        }
    }
}
