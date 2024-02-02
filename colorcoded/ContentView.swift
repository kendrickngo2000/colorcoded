//
//  ContentView.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                Text("Background Color")
                    .foregroundColor(Color.theme.background)
                Text("Text Color")
                    .foregroundColor(Color.theme.textColor)
            }
        }
    }
}

#Preview {
    ContentView()
}
