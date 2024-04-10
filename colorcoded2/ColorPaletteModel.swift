//
//  ColorPaletteModel.swift
//  colorcoded2
//
//  Created by Kendrick Ngo on 4/10/24.
//

import Foundation
import SwiftUI

class ColorPaletteModel: ObservableObject {
    @Published var colorPalette: [Color] = []
    
    func saveColorPalette(_ palette: [Color]) {
        colorPalette = palette
    }
}
