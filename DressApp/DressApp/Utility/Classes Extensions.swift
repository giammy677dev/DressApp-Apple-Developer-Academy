//
//  Classes Extensions.swift
//  DressApp
//
//  Created by Stefano Formicola on 17/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

extension UIColor {
    
    convenience init(hex: UInt) {
        let components = (
            r: CGFloat((hex >> 16) & 0xff) / 255,
            g: CGFloat((hex >> 08) & 0xff) / 255,
            b: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.r, green: components.g, blue: components.b, alpha: 1)
    }
    
}

extension CGColor {

    convenience init(hex: CGColor) {
        let components = (
            r: CGFloat((hex >> 16) & 0xff) / 255,
            g: CGFloat((hex >> 08) & 0xff) / 255,
            b: CGFloat((hex >> 00) & 0xff) / 255
        )
        super.init(red: components.r, green: components.g, blue: components.b, alpha: 1)
    }

}

