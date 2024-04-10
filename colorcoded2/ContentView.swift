import SwiftUI

enum AppScreen: Hashable, Identifiable, CaseIterable {
    case ColorPicker
    case ColorPalette
    case ColorID
    
    var id: AppScreen {self}
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .ColorPicker:
            Label("Color Picker", systemImage: "bird")
        case .ColorPalette:
            Label("Color Palletes", systemImage: "leaf")
        case .ColorID:
            Label("Color Identification", systemImage: "tree")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .ColorPicker:
            ColorPickerNavigationStack()
        case .ColorPalette:
            ColorPaletteNavigationStack()
        case .ColorID:
            ColorIDNavigationStack()
        }
    }
}


struct AppTabView: View {
    @Binding var selection: AppScreen?
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in screen.destination
                    .tag(screen as AppScreen?)
                    .tabItem {screen.label}
            }
        }
    }
}

struct ContentView: View {
    @State private var selection: AppScreen? = .ColorPicker
    @StateObject private var colorPaletteModel = ColorPaletteModel()
    
    var body: some View {
        AppTabView(selection: $selection)
            .environmentObject(colorPaletteModel)
    }
}

#Preview {
    ContentView()
}
