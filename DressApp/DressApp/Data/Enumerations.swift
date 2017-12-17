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
    
}
