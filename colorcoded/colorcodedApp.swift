//
//  colorcodedApp.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/1/24.
//

import SwiftUI

// first file that runs in app, main
@main
struct colorcodedApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}

