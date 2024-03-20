//
//  ColorPickerScreen.swift
//  colorcoded2
//
//  Created by Kendrick Ngo on 3/19/24.
//

import SwiftUI

struct ColorPickerNavigationStack: View {
    private let COLOR_KEY = "COLOR KEY"
    private let userDefaults = UserDefaults.standard
    @State private var selectedColor: Color = Color.white
    @State private var colorList: [Color] = []
    
//    func saveColor(color: Color) {
//        let color = UIColor(color).cgColor
//        
//        if let components = color.components {
//            userDefaults.set(components, forKey: COLOR_KEY)
//            print(components)
//            print("Color Saved")
//        }
//    }
    
    func saveColor(color: Color) {
        let uiColor = UIColor(color)
        let components = uiColor.cgColor.components ?? [1, 1, 1, 1]
        userDefaults.set(components, forKey: COLOR_KEY)
        print(components)
        print("Color Saved")
        colorList.append(color)
    }
    
    func loadColor() -> Color {
        guard let array = userDefaults.object(forKey: COLOR_KEY) as? [CGFloat] else {
            return Color.black
        }
        let color = Color(.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])
        print(color)
        print("Colour loaded!")
        return color
    }

    var body: some View {
        NavigationStack {
            VStack {
                ColorPicker("Choose a color", selection: $selectedColor, supportsOpacity: true)
                    .padding()
                
                Button(action: {
                    saveColor(color: selectedColor)
                }) {
                    Text("Save Color")
                }
                
                // display color in list view
                List(colorList.indices, id: \.self) { index in
                    Rectangle()
                        .fill(colorList[index])
                        .frame(height: 50)
                }
            }
            .onAppear {
                selectedColor = loadColor()
            }
        }
    }
}

#Preview {
    ColorPickerNavigationStack()
}
