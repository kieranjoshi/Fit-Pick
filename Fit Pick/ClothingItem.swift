//
//  ClothingItem.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 8/22/24.
//

import Foundation
import SwiftData

enum ClothingType: Int, Codable{
    case Shirt
    case Pants
    case Shoes
    case Accessory
    case Outerwear
}

@Model
class ClothingItem: Identifiable {
    var image: Data
    var type: ClothingType
    var id: String
    var brand: String?
    
    init(image: Data, type: ClothingType, brand: String = ""){
        self.image = image
        self.type = type
        self.id = UUID().uuidString
        self.brand = brand
        
    }
}
