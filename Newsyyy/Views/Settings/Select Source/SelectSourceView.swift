//
//  SelectSourceView.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import SwiftUI

struct SelectSourceView: View {
    @ObservedObject var viewModel = SelectSourceViewModel()
    @State private var selectedSource: String?
    
    var onSelection: ((String) -> ())
    
    init(onSelection: @escaping ((String) -> ())) {
        self.onSelection = onSelection
    }
    
    var body: some View {
        NavigationView {
            if viewModel.loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                if viewModel.sources.isEmpty {
                    Text("No sources to show. \nPlease try with another language or country.")
                        .multilineTextAlignment(.center)
                } else {
                    List(selection: $selectedSource) {
                        ForEach(viewModel.sources,
                                id: \.self) { source in
                            Button {
                                onSelection(source.id ?? "N/A")
                            } label: {
                                HStack {
                                    Text(source.name ?? "N/A")
                                    Spacer()
                                    if source.id == viewModel.selectedSource {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.blue)
                                    }
                                }
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .navigationTitle("Sources")
                    .navigationBarItems(trailing: VStack(alignment: .leading, spacing: nil, content: {
                        HStack(alignment: .center) {
                            Text("Country: ")
                            Spacer()
                            Text(viewModel.dataStore.getCountry().rawValue)
                        }
                        HStack(alignment: .center) {
                            Text("Language: ")
                            Spacer()
                            Text(viewModel.dataStore.getLanguage().rawValue)
                        }
                    }))
                }
            }
        }
        .onAppear(perform: {
            viewModel.loading = true
            viewModel.fetchSources()
            viewModel.selectedSource = viewModel.dataStore.getSource()
        })
    }
}
