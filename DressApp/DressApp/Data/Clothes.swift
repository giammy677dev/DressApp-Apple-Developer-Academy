//
//  Cloth.swift
//  DressApp
//
//  Created by Stefano Formicola on 12/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

class Cloth {
    
    let color: Color
    let material: Material
    var description: String?
    let isElegant: Bool
    
    init(color: Color, material: Material, description: String?, elegant: Bool) {
        self.color = color
        self.material = material
        self.description = description
        isElegant = elegant
        Wardrobe.shared.add(self)
    }
    
    var matchedTrousers: [Trousers]?
    var matchedTShirts: [TShirt]?
    var matchedShirts: [Shirt]?
    var matchedSweaters: [Sweater]?
    var matchedSkirts: [Skirt]?
    var matchedShoes: [Shoes]?
    var matchedDresses: [Dress]?
    
    
    
}



class Trousers: Cloth {
    
    let model: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
}

class TShirt: Cloth {
    
    let sleeves: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.sleeves = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
}

class Shirt: Cloth {
    
    let model: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
}

class Sweater: Cloth {
    
    let model: SweaterModels
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: SweaterModels) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
}

class Skirt: Cloth {
    
}

class Shoes: Cloth {
    
}

class Dress: Cloth {
    
}
