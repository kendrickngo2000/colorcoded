//
//  ColorPicker.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/2/24.
//

import SwiftUI

struct ColorPickerView: View {
    @State private var selectedColor = Color.white

    var body: some View {
        ColorPicker("main", selection: $selectedColor) 
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
