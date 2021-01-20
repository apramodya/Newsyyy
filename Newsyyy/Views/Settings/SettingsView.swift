//
//  SettingsView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-19.
//

import SwiftUI

struct SettingsView: View {
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        NavigationView {
            List {
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
                        Text("v").bold()
                        Text(appVersion ?? "N/A")
                    })
                })
            }.navigationTitle("Settings")
            .listStyle(SidebarListStyle())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsView()
        }
    }
}
