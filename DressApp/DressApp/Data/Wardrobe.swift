//
//  Wardrobe.swift
//  DressApp
//
//  Created by Stefano Formicola on 13/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

class Wardrobe {
    
    static let shared = Wardrobe()  //Wardrobe singleton used in Wardrobe section (see Storyboard)
    
    private init() {}
    
    private var trousers: [Trousers] = []
    private var tShirts: [TShirt] = []
    private var shirts: [Shirt] = []
    private var sweaters: [Sweater] = []
    private var skirts: [Skirt] = []
    private var shoes: [Shoes] = []
    private var dresses: [Dress] = []
    
    
    func add<C: Cloth>(cloth: C) {
        /*
         Receives an object of a subclass of Cloth class
         */
        switch cloth.category {
            
            case .trousers:
                trousers.append(cloth as! Trousers)
            case .tShirt:
                tShirts.append(cloth as! TShirt)
            case .shirt:
                shirts.append(cloth as! Shirt)
            case .sweater:
                sweaters.append(cloth as! Sweater)
            case .skirt:
                skirts.append(cloth as! Skirt)
            case .shoes:
                shoes.append(cloth as! Shoes)
            case .dress:
                dresses.append(cloth as! Dress)

        }
    }
    
    func getTrousers() -> [Trousers] {
        return trousers
    }
    
    func getTShirts() -> [TShirt] {
        return tShirts
    }
    
    func getShirts() -> [Shirt] {
        return shirts
    }
    
    func getSweaters() -> [Sweater] {
        return sweaters
    }
    
    func getSkirts() -> [Skirt] {
        return skirts
    }
    
    func getShoes() -> [Shoes] {
        return shoes
    }

    func getDresses() -> [Dress] {
        return dresses
    }
    
    
    
    
}
