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
    
    private var trousers: [Trousers] = []
    private var tShirts: [TShirt] = []
    private var shirts: [Shirt] = []
    private var sweaters: [Sweater] = []
    private var skirts: [Skirt] = []
    private var shoes: [Shoes] = []
    private var dresses: [Dress] = []
    
    var categories = ["Trousers" : [Trousers](),
                      "T-Shirts" : [TShirt](),
                      "Shirts" : [Shirt](),
                      "Sweaters" : [Sweater](),
                      "Skirts" : [Skirt](),
                      "Shoes" : [Shoes](),
                      "Dresses" : [Dress]()
    ] as [String : Array<Cloth>]
    
    
    func add<C: Cloth>(cloth: C) {
        /*
         Receives an object of a subclass of Cloth class
         */
        switch cloth.category {
            
            case .trousers:
                categories["Trousers"]?.append(cloth)
            
//                trousers.append(cloth as! Trousers)
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
    
}
