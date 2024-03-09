//
//  ContentView.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 3/8/24.
//

import SwiftUI

struct ContentView: View {
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
}
