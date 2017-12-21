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
    
    private init() {
//        load()
    }
    
    private var trousers: [Trousers] = []
    private var tShirts: [TShirt] = []
    private var shirts: [Shirt] = []
    private var sweaters: [Sweater] = []
    private var skirts: [Skirt] = []
    private var shoes: [Shoes] = []
    private var dresses: [Dress] = []
    
    public var chooseElegant: Bool = false
    public var chooseCold: Bool = false
    
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
    
    func getOutfit(elegant: Bool, cold: Bool) -> Outfit {
        // Future update: matching algorithm between clothes
        if elegant {
            let chosen = dresses.popLast()
            return Outfit(trousers: chosen?.matchedTrousers?.popLast(), tShirt: nil, shirt: chosen?.matchedShirts?.popLast(), sweater: nil, skirt: nil, shoes: chosen?.matchedShoes?.popLast(), dress: nil, image: nil)
        } else {
            let chosen = tShirts.popLast()
            return Outfit(trousers: chosen?.matchedTrousers?.popLast(), tShirt: nil, shirt: nil, sweater: chosen?.matchedSweaters?.popLast(), skirt: nil, shoes: chosen?.matchedShoes?.popLast(), dress: nil, image: nil)
        }
        
    }
    
    
    func getLastOutfits() -> [Outfit] {
        return lastOutfits
    }
    
//    func save() {
//        let jsonEncoder = JSONEncoder()
//        if let savedData = try? jsonEncoder.encode(Wardrobe.shared) {
//            let defaults = UserDefaults.standard
//            defaults.set(savedData, forKey: "sharedWardrobe")
//        } else {
//            print("Failed to save data.")
//        }
//        print("Saved")
//    }
    
//    func load() {
//
//        let defaults = UserDefaults.standard
//
//        if let savedData = defaults.object(forKey: "sharedWardrobe") as? Data {
//            let jsonDecoder = JSONDecoder()
//
//            do {
//                let savedWardrobe = try jsonDecoder.decode(Wardrobe.self, from: savedData)
//                self.trousers = savedWardrobe.trousers
//                self.tShirts = savedWardrobe.tShirts
//                self.shirts = savedWardrobe.shirts
//                self.sweaters = savedWardrobe.sweaters
//                self.skirts = savedWardrobe.skirts
//                self.shoes = savedWardrobe.shoes
//                self.dresses = savedWardrobe.dresses
//                self.lastOutfits = savedWardrobe.lastOutfits
//            } catch {
//                print("Failed to load data.")
//            }
//
//
//        }
//    }
    
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
    
    func match<C: Cloth>(cloth: C, category: ClothCategory) -> [Any]? {
        /*
         Every cloth added to the wardrobe should have a collection of matched clothes. To find clothes that match that cloth, a
         switch case on the category of the clothes to find iterates over the global category array and through the match function
         of every cloth it is possible to find out if the condition is verified. Then, an array of matched clothes is returned
         */
        guard cloth.category != category else {
            return nil
        }
        
        var clothesMatched: [Any]?
        
        switch category {
            
            case .dress:
                for dress in dresses {
                    if dress.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [Dress]()
                            continue
                        }
                        clothesMatched?.append(dress)
                    }
                }
            
            case .shirt:
                for shirt in shirts {
                    if shirt.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [Shirt]()
                            continue
                        }
                        clothesMatched?.append(shirt)
                    }
                }
            
            case .shoes:
                for item in shoes {
                    if item.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [Shoes]()
                            continue
                        }
                        clothesMatched?.append(item)
                    }
                }
            
            case .skirt:
                for skirt in skirts {
                    if skirt.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [Skirt]()
                            continue
                        }
                        clothesMatched?.append(skirt)
                    }
                }
            
            case .sweater:
                for sweater in sweaters {
                    if sweater.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [Sweater]()
                            continue
                        }
                        clothesMatched?.append(sweater)
                    }
                }
            
            case .trousers:
                for item in trousers {
                    if item.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [Trousers]()
                            continue
                        }
                        clothesMatched?.append(item)
                    }
                }
            
            case .tShirt:
                for tShirt in tShirts {
                    if tShirt.matches(cloth) {
                        guard let _ = clothesMatched else {
                            clothesMatched = [TShirt]()
                            continue
                        }
                        clothesMatched?.append(tShirt)
                    }
                }
        }
        
        return clothesMatched
        
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
