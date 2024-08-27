//
//  ItemUpdateView.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 8/22/24.
//

import Foundation
import SwiftUI
import SwiftData
import PhotosUI

struct ItemUpdateView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var clothing: ClothingItem
    @StateObject private var viewModel = PhotoPickerViewModel()
    @State private var tempBrand: String = ""
    @State private var tempType: ClothingType = .shirt
    var body: some View {
        
        NavigationStack {
            Form {
//                if let uiImage = viewModel.selectedImage{
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 200,alignment: .center)
//                        .cornerRadius(10)
//                    
//                }
//                else if let uiImage = UIImage(data: clothing.image) {
//                    Image(uiImage: uiImage)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 200, height: 200,alignment: .center)
//                        .cornerRadius(10)
//                }
//                PhotosPicker(selection: $viewModel.imageSelection, matching: .images){
//                    Label("Update Image", systemImage: "photo")
//                        .foregroundStyle(.blue)
//                }
                Section(header: Text("Info")){
                    TextField("Updated Brand", text: $tempBrand)
                            .textInputAutocapitalization(.words)
                    Picker(selection: $tempType, label: Text("Clothing Type")) {
                        ForEach(ClothingType.allCases) { clothingtype in
                            Text(clothingtype.title).tag(clothingtype)
                        }
                    }
                }
                
                Section{
                    Button("Update"){
                        clothing.brand = tempBrand
                        clothing.type = tempType
                        dismiss()
                    }
                }
            }.navigationBarTitle("Update Clothing Item")
                .navigationBarItems(trailing: Button("Cancel") {
                    dismiss()
                })
                .onAppear {
                    tempBrand = clothing.brand
                    tempType = clothing.type
                }
        }
    }
}
