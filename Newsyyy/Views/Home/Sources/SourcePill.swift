//
//  SourcePill.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-20.
//

import SwiftUI

struct SourcePill: View {
    var source: Source
    
    var body: some View {
        Text(source.name ?? "N/A")
            .fontWeight(.bold)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(Color.purple)
            .cornerRadius(40)
            .foregroundColor(.white)
            .padding(4)
    }
}

struct SourcePill_Previews: PreviewProvider {
    static var previews: some View {
        SourcePill(source: Source.get())
    }
}
