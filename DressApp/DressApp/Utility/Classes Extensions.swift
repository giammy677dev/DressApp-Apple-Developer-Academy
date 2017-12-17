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

//extension CGColor {
//
//    convenience init(hex: UInt) {
//        let components = (
//            r: CGFloat((hex >> 16) & 0xff) / 255,
//            g: CGFloat((hex >> 08) & 0xff) / 255,
//            b: CGFloat((hex >> 00) & 0xff) / 255
//        )
//        self.init(red: components.r, green: components.g, blue: components.b, alpha: 1)
//    }
//
//}

extension Date {
    static func from(day: Int, month: Int, year: Int) -> Date {
        let gregorianCalendar = NSCalendar(calendarIdentifier: .gregorian)!
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = gregorianCalendar.date(from: dateComponents)!
        return date
    }
}
// Call it as Date.from(year: , month: , day: ) and it returns a Date object
