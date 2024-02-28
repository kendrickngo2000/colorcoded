//
//  HomeView.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/1/24.
//
//import SwiftUI
//
//struct HomeView: View {
//    @State private var searchText = ""
//    
//    var body: some View {
//        ZStack
//        NavigationView {
//            VStack {
//                Text("hey button")
////                NavigationLink(destination: ColorPickerView()) {  // why does this referencing here not work
//                NavigationLink(destination: ContentView()) {        // but this doeshow t
//                    CircleButton(iconName: "plus")
//                        .navigationTitle("main")
//                }
//            }
//        }
//    }
//}
import SwiftUI

struct HomeView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                
                Text("hey button")
                NavigationLink(destination: ContentView()) {
                    CircleButton(iconName: "plus")
                        .navigationTitle("main")
                }
            }
        }
    }
}
