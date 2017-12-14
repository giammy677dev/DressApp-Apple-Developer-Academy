//
//  Enumerations.swift
//  DressApp
//
//  Created by Stefano Formicola on 13/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

enum ClothCategory {
    
    case trousers
    case tShirt
    case shirt
    case sweater
    case skirt
    case shoes
    case dress
    
    
}

enum Material {
    case cotton
    case wool
    case cashmere
    case synthetic
    case jeans
}

enum SweaterModels {
    case sweatshirt
    case pullover
}

enum Model {
    case long
    case short
}

enum Color {
    
    case black
    case white
    case navajoWhite
    case red
    case blue
    case lightSkyBlue
    case navy
    case torchRed
    case saddleBrown
    case pink
    case silver
    case maroon
    case myrtle
    case indigo
    case putty
    case yellow
    
    func hex() -> Int {
        
        switch self {
            
            case .black:
                return 0x000000
            case .white:
                return 0xFFFFFF
            case .navajoWhite:
                return 0xFFE1B0
            case .red:
                return 0xFF0000
            case .blue:
                return 0x0020C2
            case .lightSkyBlue:
                return 0x82E0FF
            case .navy:
                return 0x000080
            case .torchRed:
                return 0xFF0041
            case .saddleBrown:
                return 0x824200
            case .pink:
                return 0xFFC0CE
            case .silver:
                return 0xC0C0C0
            case .maroon:
                return 0x800000
            case .myrtle:
                return 0x004200
            case .indigo:
                return 0x6000A1
            case .putty:
                return 0xD2B06A
            case .yellow:
                return 0xFFFF00
        }
        
    }
}
