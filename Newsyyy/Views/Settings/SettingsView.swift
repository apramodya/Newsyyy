//
//  SettingsView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-19.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("News").font(.title)
                    
                    NewsSettingsRowView(title: "Selected country",
                                        value: viewModel.selectedCountry)
                    NewsSettingsRowView(title: "Selected source",
                                        value: viewModel.selectedSource)
                    NewsSettingsRowView(title: "Selected language",
                                        value: viewModel.selectedLanguage)
                })
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("About").font(.title)
                    
                    Button("Privacy Policy") {
                        print("Privacy Policy")
                    }.foregroundColor(.blue)
                    
                    Button("Terms and Conditions") {
                        print("Terms and Conditions")
                    }.foregroundColor(.blue)
                })
                
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
    
    init(title: String, value: String, imageName: String = "square.and.pencil") {
        self.title = title
        self.value = value
        self.imageName = imageName
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.callout)
            Button(action: {
            }, label: {
                Image(systemName: imageName)
            }).foregroundColor(.blue)
        })
    }
    
    
}
