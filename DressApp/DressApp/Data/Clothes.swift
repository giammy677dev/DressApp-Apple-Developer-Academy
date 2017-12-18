//
//  Cloth.swift
//  DressApp
//
//  Created by Stefano Formicola on 12/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

class Cloth {
    
    let category: ClothCategory
    let color: Color
    let material: Material
    var description: String?
    var isElegant: Bool
    var lastTimeUsed: Date?
    let image: UIImage? = nil
    
    init(color: Color, material: Material, description: String?, elegant: Bool, category: ClothCategory) {
        self.color = color
        self.material = material
        self.description = description
        self.category = category
        isElegant = elegant
        Wardrobe.shared.add(cloth: self)
        self.askWardrobeForMatchedClothes()
    }
    
    var matchedTrousers: [Trousers]?
    var matchedTShirts: [TShirt]?
    var matchedShirts: [Shirt]?
    var matchedSweaters: [Sweater]?
    var matchedSkirts: [Skirt]?
    var matchedShoes: [Shoes]?
    var matchedDresses: [Dress]?
    
    private func askWardrobeForMatchedClothes() {
        
        matchedTrousers = Wardrobe.shared.match(cloth: self, category: .trousers) as? [Trousers]
        matchedTShirts = Wardrobe.shared.match(cloth: self, category: .tShirt) as? [TShirt]
        matchedShirts = Wardrobe.shared.match(cloth: self, category: .shirt) as? [Shirt]
        matchedSweaters = Wardrobe.shared.match(cloth: self, category: .sweater) as? [Sweater]
        matchedSkirts = Wardrobe.shared.match(cloth: self, category: .skirt) as? [Skirt]
        matchedShoes = Wardrobe.shared.match(cloth: self, category: .shoes) as? [Shoes]
        matchedDresses = Wardrobe.shared.match(cloth: self, category: .dress) as? [Dress]
        
    }
    
    func matches(with: Cloth) -> Bool {
        
        if true {
        
            switch with.category {
                case .dress:
                    matchedDresses?.append(with as! Dress)
                case .shirt:
                    matchedShirts?.append(with as! Shirt)
                case .shoes:
                    matchedShoes?.append(with as! Shoes)
                case .skirt:
                    matchedSkirts?.append(with as! Skirt)
                case .sweater:
                    matchedSweaters?.append(with as! Sweater)
                case .trousers:
                    matchedTrousers?.append(with as! Trousers)
                case .tShirt:
                    matchedTShirts?.append(with as! TShirt)
            }
            return true
            
        }

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
    
    convenience init(color: Color, material: Material, description: String?, elegant: Bool) {
        self.init(color: color, material: material, description: description, elegant: elegant, category: .skirt)
    }
    
}

class Shoes: Cloth {
    
    convenience init(color: Color, material: Material, description: String?, elegant: Bool) {
        self.init(color: color, material: material, description: description, elegant: elegant, category: .shoes)
    }
    
}

class Dress: Cloth {
    
    convenience init(color: Color, material: Material, description: String?, elegant: Bool) {
        self.init(color: color, material: material, description: description, elegant: elegant, category: .dress)
    }
}
