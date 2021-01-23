//
//  SourcesCollection.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import SwiftUI

struct SourcesCollection: View {
    var sources: [Source]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 1) {
                ForEach(sources) { source in
                    SourcePill(source: source)
                }
            }
        }
        .padding(10)
    }
}

struct SourcesCollection_Previews: PreviewProvider {
    static var previews: some View {
        SourcesCollection(sources: [Source.get(), Source.get()])
    }
}
