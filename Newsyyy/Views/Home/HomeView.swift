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
            List {
                NewsRow(headerName: "Featured in USA",
                        articles: viewModel.articlesFeaturedByCountry)
                
                NewsRow(headerName: "Featured in BBC News",
                        articles: viewModel.articlesFeaturedBySource)
            }
            .navigationTitle("Newsyyy")
            .listStyle(InsetListStyle())
            .listRowInsets(EdgeInsets())
        }
        .onAppear {
            viewModel.fetchArticlesBySource()
            viewModel.fetchArticlesByCountry()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
