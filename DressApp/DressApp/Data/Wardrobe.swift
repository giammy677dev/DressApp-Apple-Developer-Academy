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
    
    private var lastOutfits: [Outfit] = []
    /*
     For future updates: a user could save an outfit in a preferred outfits array
     */
    func addToLastOutfits(outfit: Outfit) {
        lastOutfits.insert(outfit, at: 0)
        if lastOutfits.count > 7 {
            _ = lastOutfits.popLast()
        }
    }
    
    func getLastOutfits() -> [Outfit] {
        return lastOutfits
    }
    
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
    
    
    
    func match<C: Cloth>(cloth:C) -> [C] {
        
        if cloth is Trousers {
            
            var matchedTrousers: [Trousers] = []
            
            for item in trousers {
                if matches(cloth: cloth, with: item) {
                    matchedTrousers.append(item)
                }
            }
            
            return matchedTrousers as! [C]
            
        }
        
        
        let c: [C] = []
        
        return c
        
    }
    
    
    func matches<C: Cloth>(cloth: C, with: C) -> Bool {
        return true
    }
    
    
    /*
     Get methods
     */
    
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
