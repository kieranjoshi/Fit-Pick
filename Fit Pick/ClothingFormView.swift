//
//  ClothingFormView.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 8/19/24.
//

import SwiftUI
import PhotosUI

struct ClothingFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var clothingItem: PhotosPickerItem?
    @AppStorage("clothingType") private var clothingType: String = ""
    @State private var index = 0
    var clothingOpetions = ["Shirt","Pants","Shoes","Accessory","Outerwear"]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select a Photo")) {
                    PhotosPicker(selection: $clothingItem, matching: .images){
                        HStack{
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("Add an Image")
                        }.tint(.blue)
                    }
                }
                Picker(selection: $index, label: Text("Clothing Type")) {
                    ForEach(0 ..< clothingOpetions.count) {
                        Text(self.clothingOpetions[$0])
                    }
                }
                Section {
                    Button("Submit") {
                        // Handle form submission here
                        // After submission, dismiss the form
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationBarTitle("Add Clothing")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

#Preview {
    ClothingFormView()
}
