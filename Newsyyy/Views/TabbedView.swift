//
//  TabView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-19.
//

import SwiftUI

struct TabbedView: View {
    @State private var selection: Tab = .home

    enum Tab {
        case home
        case settings
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(Tab.home)
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(Tab.settings)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedView()
    }
}
