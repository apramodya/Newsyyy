//
//  ContentView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-19.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            Text(">>>")
        }.navigationBarTitle("Articles")
        .onAppear {
            viewModel.fetchArticlesByCountry()
        }
    }
}
