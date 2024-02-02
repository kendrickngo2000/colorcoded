//
//  color.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/1/24.
//

import Foundation
import SwiftUI

extension Color {
   static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let textColor = Color("TextColor")
}
