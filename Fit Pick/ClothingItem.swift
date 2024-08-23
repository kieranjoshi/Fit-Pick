//
//  ClothingItem.swift
//  Fit Pick
//
//  Created by Kieran Joshi on 8/22/24.
//

import Foundation
import SwiftData

enum ClothingType: Int, Codable, CaseIterable, Identifiable, Equatable {
    case shirt
    case pants
    case shoes
    case accessory
    case outerwear
    
    var id: Int{
        rawValue
    }
}

extension ClothingType{
    var title: String {
        switch self{
            case .shirt:
                return "Shirt"
            case .pants:
                return "Pants"
            case .shoes:
                return "Shoes"
            case .accessory:
                return "Accessory"
            case .outerwear:
                return "Outerwear"
        }
    }
}

@Model
class ClothingItem: Identifiable {
    var image: Data
    var type: ClothingType
    var id: String
    var brand: String
    
    init(image: Data, type: ClothingType, brand: String = ""){
        self.image = image
        self.type = type
        self.id = UUID().uuidString
        self.brand = brand
        
    }
}
