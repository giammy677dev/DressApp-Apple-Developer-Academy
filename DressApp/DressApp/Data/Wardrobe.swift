//
//  Wardrobe.swift
//  DressApp
//
//  Created by Stefano Formicola on 13/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

class Wardrobe: Codable {
    
    static let shared = Wardrobe.loadFromPersistence()  //Wardrobe singleton used in Wardrobe section (see Storyboard)
    
    private init() {
        print("Wardrobe Init")
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
    
    // TODO: - Future updates
    /*
     - Users could save favorite outfits
     */
    
    //     MARK: - Load/Save functions
    private func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(Wardrobe.shared) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "sharedWardrobe")
        } else {
            print("Failed to save data.")
        }
        print("Wardrobe Saved")
    }
    
    static func loadFromPersistence() -> Wardrobe {
        let defaults = UserDefaults.standard
        if let savedData = defaults.object(forKey: "sharedWardrobe") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                print("Loading data.")
                let savedWardrobe = try jsonDecoder.decode(Wardrobe.self, from: savedData)
                print(savedWardrobe)
                print("Loaded data.")
                return savedWardrobe
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Failed to load data.")
                print("\(key)")
                print("\(context.debugDescription)")
            } catch DecodingError.typeMismatch(let key, let context) {
                print("Failed to load data.")
                print("\(key)")
                print("\(context.debugDescription)")
            } catch DecodingError.valueNotFound(let key, let context) {
                print("Failed to load data.")
                print("\(key)")
                print("\(context.debugDescription)")
            } catch {
                print("Failed to load data.")
            }
        } else {
            print("No saved data.")
        }
        return Wardrobe()
    }
    
    //    MARK: - Wardrobe functions
    
    func add<C: Cloth>(cloth: C) {
        // Receives an object of a subclass of Cloth class
        
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
        
        self.save()
    }
    
    
    func addToLastOutfits(outfit: Outfit) {
        lastOutfits.insert(outfit, at: 0)
        if lastOutfits.count > 7 {
            _ = lastOutfits.popLast()
        }
    }
    
    func getOutfit(temperature: Int, elegant: Bool, cold: inout Bool) -> Outfit? {
        // Future update: matching algorithm between clothes
        print("In getOutfit")
        var trousers: Trousers?
        var shirt: Shirt?
        var tShirt: TShirt?
        var sweater: Sweater?
        var shoes: Shoes?
        var dress: Dress?
        var skirt: Skirt?
        
        if temperature < 12 {
            cold = true
        }
        
        let elegant = Wardrobe.shared.chooseElegant
        let userGenre = User.shared.genre!
        print("elegant")
        switch elegant {
        case true:
            do {
                print(elegant)
                if userGenre == .female {
                    // Random choice between skirt, trousers or dress
                    let random = arc4random_uniform(3)
                    print(random)
                    switch random {
                    case 0: //A skirt has been selected and now the function is asking for an outfit
                        skirt = pickRandom(array: Wardrobe.shared.skirts, elegant: elegant, cold: cold)
                        shirt = pickRandom(array: skirt?.matchedShirts, elegant: elegant, cold: cold)
                        shoes = pickRandom(array: skirt?.matchedShoes, elegant: elegant, cold: cold) ?? pickRandom(array: (shirt?.matchedShoes)!, elegant: elegant, cold: cold)
                        print(skirt)
                        print(shirt)
                        print(shoes)
                    case 1: //Trousers have been selected
                        trousers = pickRandom(array: Wardrobe.shared.trousers, elegant: elegant, cold: cold)
                        shirt = pickRandom(array: trousers?.matchedShirts, elegant: elegant, cold: cold)
                        shoes = pickRandom(array: trousers?.matchedShoes, elegant: elegant, cold: cold) ?? pickRandom(array: (shirt?.matchedShoes)!, elegant: elegant, cold: cold)
                        print(trousers)
                        print(shirt)
                        print(shoes)
                    case 2: //A dress has been selected
                        dress = pickRandom(array: Wardrobe.shared.dresses, elegant: elegant, cold: cold)
                        shoes = pickRandom(array: dress?.matchedShoes, elegant: elegant, cold: cold)
                        print(dress)
                        print(shoes)
                    default: break
                    }
                    
                } else {
                    // User is male
                    dress = pickRandom(array: Wardrobe.shared.dresses, elegant: elegant, cold: cold)
                    trousers = pickRandom(array: dress?.matchedTrousers, elegant: elegant, cold: cold)
                    shirt = pickRandom(array: trousers?.matchedShirts, elegant: elegant, cold: cold)
                    shoes = pickRandom(array: trousers?.matchedShoes, elegant: elegant, cold: cold) ?? pickRandom(array: (shirt?.matchedShoes)!, elegant: elegant, cold: cold) ?? pickRandom(array: dress?.matchedShoes, elegant: elegant, cold: cold)
                    print(dress)
                    print(trousers)
                    print(shirt)
                    print(shoes)
                }
            }
            
        case false:
            do {
                print(elegant)
                if userGenre == .female {
                    let random = arc4random_uniform(2)
                    switch random {
                    case 0: //A skirt has been selected and now the function is asking for an outfit
                        skirt = pickRandom(array: Wardrobe.shared.skirts, elegant: elegant, cold: cold)
                    case 1: //Trousers have been selected
                        trousers = pickRandom(array: Wardrobe.shared.trousers, elegant: elegant, cold: cold)
                    default: break
                    }
                    print(skirt)
                    print(trousers)
                } else {
                    // User is male
                    trousers = pickRandom(array: Wardrobe.shared.trousers, elegant: elegant, cold: cold)
                    print(trousers)
                }
                
                let random = arc4random_uniform(cold ? 3 : 2)
                switch random { //Choosing between sweater and shirt
                case 0: //T-Shirt
                    tShirt = pickRandom(array: trousers?.matchedTShirts, elegant: elegant, cold: cold) ?? pickRandom(array: skirt?.matchedTShirts, elegant: elegant, cold: cold)
                case 1: //Shirt
                    shirt = pickRandom(array: trousers?.matchedShirts, elegant: elegant, cold: cold) ?? pickRandom(array: skirt?.matchedShirts, elegant: elegant, cold: cold)
                case 2: //Sweater
                    sweater = pickRandom(array: trousers?.matchedSweaters, elegant: elegant, cold: cold) ?? pickRandom(array: skirt?.matchedSweaters, elegant: elegant, cold: cold)
                default: break
                }
                print("last 3 clothes")
                print(tShirt)
                print(shirt)
                print(sweater)
            }
        }
        
    print("finish")
        
    switch (trousers, skirt, dress) {
    case (nil, nil, nil): return nil
    default: break
    }
    
    switch (shirt, tShirt, sweater) {
    case (nil, nil, nil): return nil
    default: break
    }
        
    return Outfit(trousers: trousers, tShirt: tShirt, shirt: shirt, sweater: sweater, skirt: skirt, shoes: shoes, dress: dress, image: nil)
    
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



// MARK: - Get methods

func getLastOutfits() -> [Outfit] {
    return lastOutfits
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

// MARK: Used for matching
func pickRandom<C: Cloth>(array: [C]?, elegant: Bool, cold: Bool) -> C? {
    // From an array of clothes, it returns an available random cloth that respect the booleans elegant and cold
    
    let hotMaterials: [Material] = [.cotton, .synthetic, .jeans]
    var toReturn: C?
    
    guard let _ = array else {return nil}
    
    while toReturn == nil {
        let cloth = array![Int(arc4random_uniform(UInt32(array!.count)))]
        if !cold {
            if hotMaterials.contains(cloth.material) && cloth.isElegant == elegant {
                toReturn = cloth
            }
        } else {
            if cloth.isElegant == elegant {
                toReturn = cloth
            }
        }
    }
    
    return toReturn!
}


// MARK: - End of Wardrobe

}

