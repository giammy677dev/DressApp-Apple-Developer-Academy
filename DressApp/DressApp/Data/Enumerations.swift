//
//  Enumerations.swift
//  DressApp
//
//  Created by Stefano Formicola on 13/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit


enum ClothCategory: String {
    
    case trousers = "Trousers"
    case tShirt = "T-Shirt"
    case shirt = "Shirt"
    case sweater = "Sweater"
    case skirt = "Skirt"
    case shoes = "Shoes"
    case dress = "Dress"
    
}

enum Material: String {
    case cotton = "Cotton"
    case wool = "Wool"
    case cashmere = "Cashmere"
    case synthetic = "Synthetic"
    case jeans = "Jeans"
}

enum SweaterModels: String {
    case sweatshirt = "Sweatshirt"
    case pullover = "Pullover"
}

enum Model: String {
    case long = "Long"
    case short = "Short"
}

enum Color: UInt {
    
    case black          =   0x000000
    case white          =   0xFFFFFF
    case navajoWhite    =   0xFFE1B0
    case red            =   0xFF0000
    case blue           =   0x0020C2
    case lightSkyBlue   =   0x82E0FF
    case navy           =   0x000080
    case torchRed       =   0xFF0041
    case saddleBrown    =   0x824200
    case pink           =   0xFFC0CE
    case silver         =   0xC0C0C0
    case maroon         =   0x800000
    case myrtle         =   0x004200
    case indigo         =   0x6000A1
    case putty          =   0xD2B06A
    case yellow         =   0xFFFF00
    
    func uiColor() -> UIColor {
        
        return UIColor(hex: self.rawValue)
        
    }
    
    func match(with: Color) -> Bool {
        
        switch self {
            
        case .black:
            switch with {
                case .lightSkyBlue, .red, .torchRed:
                    return true
                default:
                    return false
            }
            
        case .white:
            switch with {
                    case .blue, .pink, .navajoWhite:
                        return true
            default:
                return false
            }
        
        case .navajoWhite:
            switch with {
                case .black, .maroon, .saddleBrown:
                    return true
            default:
                return false
            }
            
        case .red:
            switch with {
                case .white, .navajoWhite, .navy:
                    return true
                default:
                    return false
            }
            
        case .blue:
            switch with {
            case .lightSkyBlue, .torchRed, .silver:
                return true
            default:
                return false
            }
            
        case .lightSkyBlue:
            switch with {
            case .black, .navajoWhite, .pink:
                return true
            default:
                return false
            }
            
        case .navy:
            switch with {
            case .silver, .pink, .lightSkyBlue, .white:
                return true
            default:
                return false
            }
            
        case .torchRed:
            switch with {
            case .navy, .navajoWhite, .white:
                return true
            default:
                return false
            }
            
        case .saddleBrown:
            switch with {
            case .putty, .navajoWhite, .pink:
                return true
            default:
                return false
            }
            
        case .pink:
            switch with {
            case .silver, .navy, .black:
                return true
            default:
                return false
            }
            
        case .silver:
            switch with {
            case .navy, .pink, .lightSkyBlue:
                return true
            default:
                return false
            }
            
        case .maroon:
            switch with {
            case .silver, .navajoWhite, .black:
                return true
            default:
                return false
            }
            
        case .myrtle:
            switch with {
            case .silver, .black, .navajoWhite:
                return true
            default:
                return false
            }
            
        case .indigo:
            switch with {
            case .saddleBrown, .white, .navajoWhite:
                return true
            default:
                return false
            }
            
        case .putty:
            switch with {
            case .black, .saddleBrown, .maroon:
                return true
            default:
                return false
            }
            
        case .yellow:
            switch with {
            case .saddleBrown, .putty, .maroon:
                return true
            default:
                return false
            }
            
        }
        
    }
    
    
    
    
    
}
