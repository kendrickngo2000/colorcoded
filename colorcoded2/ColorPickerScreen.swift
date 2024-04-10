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

    // save color from user selected ColorWheel
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
    
    // generate color palette
    func generateColorPalette(from baseColor: Color) {
        let uiColor = UIColor(baseColor)
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        var relatedColors: [Color] = []
        
        // generate 5 additional colors by adjusting the hue
        for i in 1...5 {
            let adjustedHue = (hue + CGFloat(i) * 0.1) .truncatingRemainder(dividingBy: 1.0)
            let color = Color(hue: Double(adjustedHue), saturation: Double(saturation), brightness: Double(brightness), opacity: Double(alpha))
            relatedColors.append(color)
        }
        // add the original color to the beginning of the list
        relatedColors.insert(baseColor, at: 0)
        self.relatedColors = relatedColors
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
                
                // generatecolorPalette on button press
                if isColorPaletteGenerated {
                    LazyHStack(spacing: 16) {
                        ForEach(relatedColors, id: \.self) { color in Rectangle()
                                .fill(color)
                                .frame(width: 50, height: 50)
                        }
                    }
                    .padding()
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
