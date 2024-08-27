//
//  WardrobeView.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 3/8/24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct WardrobeView: View {
    @State private var clothingItem: PhotosPickerItem?
    @State private var clothingItemData: Data?
    @State private var isAddFormPresented = false
    @Query private var clothes: [ClothingItem] = []
    var body: some View {
        ZStack{
            VStack{
                Text("Your Wardrobe")
                    .font(.largeTitle)
                    .bold()

                WardrobeShelf(title: "Shirts", clothingType: .shirt, clothes: clothes)
                WardrobeShelf(title: "Pants", clothingType: .pants, clothes: clothes)
                WardrobeShelf(title: "Shoes", clothingType: .shoes, clothes: clothes)
                WardrobeShelf(title: "Accessories", clothingType: .accessory, clothes: clothes)
                WardrobeShelf(title: "Outerwear", clothingType: .outerwear, clothes: clothes)
                
                Spacer()
                
                Button(action: {
                    isAddFormPresented.toggle()
                }) {
                    Image(systemName: "plus.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isAddFormPresented) {
                    ClothingFormView()
                }
                
                
            }
        }
    }
    
}

struct WardrobeShelf: View {
    var title: String
    var clothingType: ClothingType
    var clothes: [ClothingItem]
    @State private var isUpdateFormPresented = false
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 24)
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top, spacing: 10) {
                    ForEach(clothes.filter { $0.type == clothingType }) { clothing in
                        if let uiImage = UIImage(data: clothing.image) {

                            Button(action: {
                                isUpdateFormPresented.toggle()
                            }) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80,alignment: .center)
                                    .cornerRadius(10)
                            }.sheet(isPresented: $isUpdateFormPresented) {
                                ItemUpdateView(clothing: clothing)
                            }
                        }
                    }
                }
            }.fixedSize().padding(.leading, 14)
        }
    }
}

#Preview {
        WardrobeView()
            .modelContainer(for:[ClothingItem.self], inMemory: true)
}

