//
//  DefaultImageView.swift
//  Course List (Udemy iOS)
//
//  Created by Pedro Marques on 13/04/24.
//

import SwiftUI

struct DefaultImageView: View {
    var body: some View {
        
        VStack {
            ProgressView()
                .padding()
            Image(systemName: "books.vertical")
                .font(.largeTitle)
                .padding(.bottom, 3)
            Text("Grabing the image...")
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity)
        .background {
            Color.gray
                .opacity(0.5)
        }
    }
}

#Preview {
    DefaultImageView()
}
