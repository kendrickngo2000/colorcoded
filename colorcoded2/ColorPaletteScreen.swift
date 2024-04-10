//
//  ColorPaletteScreen.swift
//  colorcoded2
//
//  Created by Kendrick Ngo on 3/19/24.
//

import SwiftUI

struct ColorPaletteNavigationStack: View {
    @EnvironmentObject var colorPaletteModel: ColorPaletteModel // Access the ColorPaletteModel from the environment
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Color Palettes")
                if !colorPaletteModel.colorPalette.isEmpty {
                    HStack(spacing: 16) {
                        ForEach(colorPaletteModel.colorPalette, id: \.self) { color in
                            Rectangle()
                                .fill(color)
                                .frame(width: 50, height: 50)
                        }
                    }
                    .padding()
                } else {
                    Text("No color palette generated")
                }
            }
        }
    }
}
//#Preview {
//    ColorPaletteNavigationStack()
//}

