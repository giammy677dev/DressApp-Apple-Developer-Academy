//
//  Cloth.swift
//  DressApp
//
//  Created by Stefano Formicola on 12/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

class Cloth {
    
    let category: ClothCategory
    let color: Color
    let material: Material
    var description: String?
    var isElegant: Bool
    var lastTimeUsed: Date?
    
    init(color: Color, material: Material, description: String?, elegant: Bool, category: ClothCategory) {
        self.color = color
        self.material = material
        self.description = description
        self.category = category
        isElegant = elegant
        Wardrobe.shared.add(cloth: self)
        
    }
    
    var matchedTrousers: [Trousers]?
    var matchedTShirts: [TShirt]?
    var matchedShirts: [Shirt]?
    var matchedSweaters: [Sweater]?
    var matchedSkirts: [Skirt]?
    var matchedShoes: [Shoes]?
    var matchedDresses: [Dress]?
    
    func askWardrobeForMatchedClothes() {
        
        
        
        
    }
    
    
}



class Trousers: Cloth {
    
    let model: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant, category: .trousers)
    }
    
}

class TShirt: Cloth {
    
    let sleeves: Model
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.sleeves = model
        super.init(color: color, material: material, description: description, elegant: elegant, category: .tShirt)
    }
    
}

class Shirt: Cloth {
    
    let model: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant, category: .shirt)
    }
    
}

class Sweater: Cloth {
    
    let model: SweaterModels
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: SweaterModels) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant, category: .sweater)
    }
    
}

class Skirt: Cloth {
    
}

class Shoes: Cloth {
    
}

class Dress: Cloth {
    
}
