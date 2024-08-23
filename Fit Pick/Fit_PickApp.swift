//
//  Fit_PickApp.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 3/8/24.
//

import SwiftUI
import SwiftData
@main
struct Fit_PickApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for:[ClothingItem.self])
        }
    }
}
