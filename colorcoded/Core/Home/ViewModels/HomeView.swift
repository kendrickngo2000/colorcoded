//
//  HomeView.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/1/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack  {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
            
            // content layer
            VStack {
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    NavigationView{
        HomeView()
            .navigationBarHidden(true)
    }
}
