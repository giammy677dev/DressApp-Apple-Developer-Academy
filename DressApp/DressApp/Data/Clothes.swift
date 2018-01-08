//
//  Cloth.swift
//  DressApp
//
//  Created by Stefano Formicola on 12/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

class Cloth: Codable {
    
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
        self.askWardrobeForMatchedClothes()
        Wardrobe.shared.add(cloth: self)
    }
    
    var matchedTrousers: [Trousers]?
    var matchedTShirts: [TShirt]?
    var matchedShirts: [Shirt]?
    var matchedSweaters: [Sweater]?
    var matchedSkirts: [Skirt]?
    var matchedShoes: [Shoes]?
    var matchedDresses: [Dress]?
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(self) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "cloth")
        } else {
            print("Failed to save data.")
        }
        print("Saved")
    }
    
    private func askWardrobeForMatchedClothes() {
        
        matchedTrousers = Wardrobe.shared.match(cloth: self, category: .trousers) as? [Trousers]
        matchedTShirts = Wardrobe.shared.match(cloth: self, category: .tShirt) as? [TShirt]
        matchedShirts = Wardrobe.shared.match(cloth: self, category: .shirt) as? [Shirt]
        matchedSweaters = Wardrobe.shared.match(cloth: self, category: .sweater) as? [Sweater]
        matchedSkirts = Wardrobe.shared.match(cloth: self, category: .skirt) as? [Skirt]
        matchedShoes = Wardrobe.shared.match(cloth: self, category: .shoes) as? [Shoes]
        matchedDresses = Wardrobe.shared.match(cloth: self, category: .dress) as? [Dress]
        
    }
    
    func matches(_ with: Cloth) -> Bool {
        
        if (self.color.match(with.color) || with.color.match(self.color)) {
        
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
        return false

    }
    
    func colorImageWithTexture(image: UIImage, texture: UIImage, color: UIColor) -> UIImage? {
        
        let imageColored = UIImageView(image: image.maskWithColor(color: color))
        let textureView = UIImageView(image: texture)
        
        imageColored.addSubview(textureView)
        
//        return takeSnapshotOfView(view: imageColored)
        return UIImage(view: imageColored)
    }
    
    
    func image() -> UIImage? {
        
        switch self.category {
        case .shirt:
            let coloredTexture = colorImageWithTexture(image: UIImage(named: self.category.rawValue + "Details")!, texture: UIImage(named: self.category.rawValue + "Texture")!, color: .white)
            let coloredImage = colorImageWithTexture(image: UIImage(named: self.category.rawValue)!, texture: coloredTexture!, color: UIColor(hex: self.color.rawValue))
            return coloredImage
        case .dress:
            let coloredImage = colorImageWithTexture(image: UIImage(named: (User.shared.genre?.rawValue)! + self.category.rawValue)!, texture: UIImage(named: (User.shared.genre?.rawValue)! + self.category.rawValue + "Texture")!, color: UIColor(hex: self.color.rawValue))
            return coloredImage
        default:
            let coloredImage = colorImageWithTexture(image: UIImage(named: self.category.rawValue)!, texture: UIImage(named: self.category.rawValue + "Texture")!, color: UIColor(hex: self.color.rawValue))
            return coloredImage
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
