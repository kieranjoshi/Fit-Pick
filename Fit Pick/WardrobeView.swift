//
//  WardrobeView.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 3/8/24.
//

import SwiftUI
import PhotosUI

struct WardrobeView: View {
    @State private var clothingItem: PhotosPickerItem?
    @State private var clothingItemData: Data?
    @State private var isFormPresented = false
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
                        }
                    }.fixedSize()
                    Text("Pants")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {

                        }
                    }.fixedSize()
                    Text("Shoes")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {

                        }
                    }.fixedSize()
                    Text("Accessories")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {

                        }
                    }.fixedSize()
                    Text("Outerwear")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,24)
                    ScrollView(.horizontal){
                        LazyHStack(alignment: .top, spacing: 10) {

                        }
                    }.fixedSize()
                    
                }
//                PhotosPicker(selection: $clothingItem, matching: .images){
//                    HStack{
//                        Image(systemName: "photo")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 30)
//                        Text("Add an Image")
//                    }.tint(.blue)
//                }
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
//            .onChange(of: clothingItem){
//                Task {
//                    if let loaded = try? await clothingItem?.loadTransferable(type: Data.self){
//                        clothingItemData = loaded
//                    }
//                    else{
//                        print("Failed")
//                    }
//                }
//            }
            
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

struct WardrobeView_Previews: PreviewProvider {
    static var previews: some View{
        WardrobeView()
    }
}
