//
//  Wardrobe.swift
//  DressApp
//
//  Created by Stefano Formicola on 13/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

class Wardrobe {
    
    static let shared = Wardrobe()
    
    private init() {}
    
    var trousers: [Trousers] = []
    var tShirts: [TShirt] = []
    var shirts: [Shirt] = []
    var sweaters: [Sweater] = []
    var skirts: [Skirt] = []
    var shoes: [Shoes] = []
    var dresses: [Dress] = []
    
    
    
}
