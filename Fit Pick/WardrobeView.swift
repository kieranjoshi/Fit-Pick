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
    @State private var isFormPresented = false
    @Query private var clothes: [ClothingItem] = []
    var body: some View {
        ZStack{
            VStack{
                Text("Your Wardrobe")
                    .font(.largeTitle)
                    .bold()
                
                VStack{
                    Text("Shirts")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {
                            ForEach(clothes.filter { $0.type == .shirt}){ clothing in
                                let clothingData = clothing.image
                                if let uiImage = UIImage(data: clothingData){
                                    Image(uiImage:uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 90, maxHeight: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                    }.fixedSize()
                    Text("Pants")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {
                            ForEach(clothes.filter { $0.type == .pants}){ clothing in
                                let clothingData = clothing.image
                                if let uiImage = UIImage(data: clothingData){
                                    Image(uiImage:uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 90, maxHeight: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                    }.fixedSize()
                    Text("Shoes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {
                            ForEach(clothes.filter { $0.type == .shoes}){ clothing in
                                let clothingData = clothing.image
                                if let uiImage = UIImage(data: clothingData){
                                    Image(uiImage:uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 90, maxHeight: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                    }.fixedSize()
                    Text("Accessories")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {
                            ForEach(clothes.filter { $0.type == .accessory}){ clothing in
                                let clothingData = clothing.image
                                if let uiImage = UIImage(data: clothingData){
                                    Image(uiImage:uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 90, maxHeight: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                    }.fixedSize()
                    Text("Outerwear")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {
                            ForEach(clothes.filter { $0.type == .outerwear}){ clothing in
                                let clothingData = clothing.image
                                if let uiImage = UIImage(data: clothingData){
                                    Image(uiImage:uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: 90, maxHeight: 90)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                        }
                    }.fixedSize()
                    
                }
                
                Spacer()
                Button(action: {
                    isFormPresented.toggle()
                }) {
                    Image(systemName: "plus.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                }
                .sheet(isPresented: $isFormPresented) {
                    ClothingFormView()
                }


            }
        }
    }
    
}

struct WardrobeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.purple)
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}

#Preview {
        WardrobeView()
            .modelContainer(for:[ClothingItem.self], inMemory: true)
}

