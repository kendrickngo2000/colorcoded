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
    @State private var isColorPaletteGenerated: Bool = false
    @State private var selectedPaletteColor: Color?
    @State private var relatedColors: [Color] = []

    
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
    
    func generateColorPalette() -> [Color] {
        // logic to generate color palette
        // this could be based on variations of hue, saturation, brightmess, etc
        // for simplicity, we are creating random colors
        var palette: [Color] = []
        for _ in 0..<5 {
            let color = Color(red: .random(in: 0...1),
                              green: .random(in: 0...1),
                              blue: .random(in: 0...1))
            palette.append(color)
        }
        return palette
    }
    
    func generateRelatedColors() {
        // Implement your logic to generate related colors based on the selected color
        // For simplicity, let's just create some random colors again
        for _ in 0..<5 {
            let color = Color(red: .random(in: 0...1),
                              green: .random(in: 0...1),
                              blue: .random(in: 0...1))
            relatedColors.append(color)
        }
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
                // display saved color in list view
                List(colorList.indices, id: \.self) { index in
                    Rectangle()
                        .fill(colorList[index])
                        .frame(height: 50)
                }
                // generate color palette button
                if !colorList.isEmpty {
                    Button(action: {
                        isColorPaletteGenerated = true
                    }) {
                        Text("Generate Color Palette")
                    }
                }
                // display related colors when a palette color is selected
                if let selectedPaletteColor = selectedPaletteColor {
                    Text("Related Colors:")
                        .font(.headline)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(relatedColors, id: \.self) {
                                color in Rectangle()
                                    .fill(color)
                                    .frame(width: 50, height: 50)
                                    .onTapGesture {
                                        print("Selected color: \(color)")
                                    }
                            }
                        }
                        .padding()
                    }
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
