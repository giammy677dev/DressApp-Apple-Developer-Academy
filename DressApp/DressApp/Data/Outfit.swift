//
//  Outfits.swift
//  DressApp
//
//  Created by Stefano Formicola on 14/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

class Outfit: Codable {
    
    let trousers: Trousers?
    let tShirt: TShirt?
    let shirt: Shirt?
    let sweater: Sweater?
    let skirt: Skirt?
    let shoes: Shoes?
    let dress: Dress?
    
    var imageAvatar: Data?
    
    init(trousers: Trousers?, tShirt: TShirt?, shirt: Shirt?, sweater: Sweater?, skirt: Skirt?, shoes: Shoes?, dress: Dress?, image: UIImage?) {
        self.trousers = trousers
        self.tShirt = tShirt
        self.shirt = shirt
        self.sweater = sweater
        self.skirt = skirt
        self.shoes = shoes
        self.dress = dress
        
//      Here goes the JPEG of the dressed avatar - go to Utility folder for the func definition (class extension)
        self.imageAvatar = UIImageJPEGRepresentation(dressedAvatar(with: self)!, 0.8)
        
    }
    
    
}




