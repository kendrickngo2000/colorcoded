//
//  ColorPickerView.swift
//  colorcoded
//
//  Created by Kendrick Ngo on 2/15/24.
//

import SwiftUI

//struct ColorData {
//    private var COLOR_KEY = "COLOR_KEY"
//    private let userDefaults = UserDefaults.standard
//    
//    func saveColor(color: Color) {
//        let color = UIColor(color).cgColor
//        
//        if let components = color.components {
//            userDefaults.set(components, forKey: COLOR_KEY)
//            print(components)   // opt: array of RGB values
//            print("color saved!")
//        }
//    }
//    
//    func loadColor() -> Color {
//        guard let array = userDefaults.object(forKey: COLOR_KEY) as? [CGFloat] else {
//            return Color.black
//        }
//        
//        let color = Color(.sRGB, red: array[0], green: array[1], blue: array[2], opacity: array[3])
//        print(color)
//        print("Colour loaded!")
//        return color
//    }
//}




//#Preview {
//    ColorPickerView()
//}
//
//struct ColorPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ColorPickerView()
//                .previewLayout(.sizeThatFits)
//                .colorScheme(.dark)
//        }
//    }
//}
