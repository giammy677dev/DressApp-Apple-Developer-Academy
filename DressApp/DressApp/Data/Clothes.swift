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
    }
    
    var matchedTrousers: [Cloth]?
    var matchedTShirts: [Cloth]?
    var matchedShirts: [Cloth]?
    var matchedSweaters: [Cloth]?
    var matchedSkirts: [Cloth]?
    var matchedShoes: [Cloth]?
    var matchedDresses: [Cloth]?
    
    // Dizionario con tipo e array
    
    func match() {
        
        for array in globalArrays {
            
            if type(of: array) == type(of: self) {
                continue
            }
            
            for cloth in array {
                if true {
                    //array.append(cloth)
                }
            }
        }
        
    }
    
}



class Trousers: Cloth {
    
    let model: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
    enum Model {
        case long
        case short
    }
    
}

class TShirt: Cloth {
    
    let model: Sleeves
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Sleeves) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
    enum Sleeves {
        case long
        case short
    }
    
}

class Shirt: Cloth {
    
    let model: Sleeves
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Sleeves) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
    enum Sleeves {
        case long
        case short
    }
    
}

class Sweater: Cloth {
    
    let model: Model
    
    init(color: Color, material: Material, description: String?, elegant: Bool, model: Model) {
        self.model = model
        super.init(color: color, material: material, description: description, elegant: elegant)
    }
    
    enum Model {
        case sweatshirt
        case pullover
    }
    
}

class Skirt: Cloth {
    
}

class Shoes: Cloth {
    
}

class Dress: Cloth {
    
}
