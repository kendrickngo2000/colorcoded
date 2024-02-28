//
//  colorcodedApp.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/1/24.
//

import SwiftUI
//import FirebaseCore// first file that runs in app, main

@main
struct colorcodedApp: App {
    
    init() {
//        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView() // not ready yet
                HomeView()
//                ColorPickerView()
                ContentView()   // for now color is here
            }
        }
    }
}

