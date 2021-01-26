//
//  SettingsView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-19.
//

import SwiftUI

enum ActiveSheet: Identifiable {
    case Source, Language, Country
    
    var id: ActiveSheet { self }
}

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    
    @State private var activeSheet: ActiveSheet?
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("News").font(.title)
                    
                    NewsSettingsRowView(title: "Selected country",
                                        value: viewModel.selectedCountry.rawValue) {
                        activeSheet = .Country
                    }
                    NewsSettingsRowView(title: "Selected source",
                                        value: viewModel.selectedSource) {
                        activeSheet = .Source
                    }
                    NewsSettingsRowView(title: "Selected language",
                                        value: viewModel.selectedLanguage) {
                        activeSheet = .Language
                    }
                })
                .buttonStyle(PlainButtonStyle())
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("About").font(.title)
                    
                    Button("Privacy Policy") {
                        print("Privacy Policy")
                    }.foregroundColor(.blue)
                    
                    Button("Terms and Conditions") {
                        print("Terms and Conditions")
                    }.foregroundColor(.blue)
                })
                .buttonStyle(PlainButtonStyle())
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("App").font(.title)
                    
                    HStack(alignment: .center, spacing: 0, content: {
                        Text("Version ")
                            .font(.headline)
                        Text(appVersion ?? "N/A")
                    })
                })
            }
            .navigationTitle("Settings")
            .listStyle(InsetListStyle())
        }.onAppear(perform: {
            viewModel.updateUserSettings()
        })
        .sheet(item: $activeSheet, content: { sheet in
            switch sheet {
            case .Source: SelectSourceView { source in
                activeSheet = nil
                viewModel.updateSource(source)
            }
            case .Language: SelectLanguageView()
            case .Country: SelectCountryView { (country) in
                activeSheet = nil
                viewModel.updateCountry(country)
            }
            }
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
        }
    }
}

struct NewsSettingsRowView: View {
    var title: String
    var value: String
    var imageName: String
    var doAction: (() -> ())
    
    init(title: String, value: String, imageName: String = "square.and.pencil", doAction: @escaping (() -> Void)) {
        self.title = title
        self.value = value
        self.imageName = imageName
        self.doAction = doAction
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.callout)
            Button(action: {
                doAction()
            }, label: {
                Image(systemName: imageName)
            }).foregroundColor(.blue)
        })
        .padding(.vertical, 4)
    }
}
