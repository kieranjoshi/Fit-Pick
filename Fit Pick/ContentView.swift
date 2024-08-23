//
//  ContentView.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 3/8/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) private var context
    var body: some View {
            TabView{
                GeneratorView()
                    .tabItem {
                        Text("Generator")
                    }
                WardrobeView()
                    .tabItem {
                        Text("Wardrobe")
                    }
            }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for:[ClothingItem.self], inMemory: true)
}
