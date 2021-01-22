//
//  ContentView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-19.
//

import Combine
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                List {
                    if viewModel.allArticlesEmpty {
                        Text("No news to show. Please try again!")
                            .fontWeight(.medium)
                        
                        if !viewModel.sourcesAreEmpty {
                            SourcesCollection(sources: viewModel.sources)
                        }
                    } else {
                        if viewModel.articlesFeaturedByCountry.count > 0 {
                            NewsRow(headerName: "Featured in USA",
                                    articles: viewModel.articlesFeaturedByCountry)
                        }
                        
                        if !viewModel.sourcesAreEmpty {
                            SourcesCollection(sources: viewModel.sources)
                        }
                        
                        if viewModel.articlesFeaturedBySource.count > 0 {
                            NewsRow(headerName: "Featured in BBC News",
                                    articles: viewModel.articlesFeaturedBySource)
                        }
                    }
                }
                .navigationTitle("Newsyyy")
                .listStyle(InsetListStyle())
                .listRowInsets(EdgeInsets())
            }
        }
        .onAppear {
            viewModel.loading = true
            viewModel.fetchArticlesBySource()
            viewModel.fetchArticlesByCountry()
            viewModel.fetchSources()
        }
        .alert(isPresented: Binding<Bool>.constant($viewModel.errorMessage.wrappedValue != nil),
               content: { () -> Alert in
                return Alerts.shared.showErrorAlert(message: $viewModel.errorMessage.wrappedValue ?? "") {
                    viewModel.errorMessage = nil
                }
               })
        .edgesIgnoringSafeArea(.all)
    }
}
