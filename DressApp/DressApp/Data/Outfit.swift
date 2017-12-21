//
//  Outfits.swift
//  DressApp
//
//  Created by Stefano Formicola on 14/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

class Outfit {
    
    let trousers: Trousers?
    let tShirt: TShirt?
    let shirt: Shirt?
    let sweater: Sweater?
    let skirt: Skirt?
    let shoes: Shoes?
    let dress: Dress?
    
    var imageAvatar: UIImage?
    
    init(trousers: Trousers?, tShirt: TShirt?, shirt: Shirt?, sweater: Sweater?, skirt: Skirt?, shoes: Shoes?, dress: Dress?, image: UIImage?) {
        self.trousers = trousers
        self.tShirt = tShirt
        self.shirt = shirt
        self.sweater = sweater
        self.skirt = skirt
        self.shoes = shoes
        self.dress = dress
        
//      Here goes the UIImage of the dressed avatar
        self.imageAvatar = dressedAvatar(with: self)
        
    }
    
    
    
}




