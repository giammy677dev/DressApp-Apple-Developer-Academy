//
//  User.swift
//  DressApp
//
//  Created by Stefano Formicola on 14/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

let defaults = UserDefaults.standard

class User {
    
    static let shared = User()
    
    var genre: UserGenre?
    var bodyShape: BodyShape?
    var dateOfBirth: Date?
    var age: Int {  // Computed property
        let today = Date()
        let gregorian = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let ageComponents = gregorian?.components([.month, .day, .year], from: dateOfBirth!, to: today, options:[])
        
        return (ageComponents?.year!)!
    }
    var name: String?
    var profilePic: UIImage?
    
    
    /*
     As a singleton class, the init method is private and all properties of the singleton are optionals and set to nil.
     
     setUserInfo should be called at the first launch of the application to set all User's properties and in the Settings page
     to edit them.
     */
    
    private init() {}
    
    func setUserInfo(genre: UserGenre, bodyShape: BodyShape, dateOfBirth: Date, name: String) {

        self.genre = genre
        self.bodyShape = bodyShape
        self.dateOfBirth = dateOfBirth
        self.name = name
        
        if genre == .male {
            profilePic = nil
        } else {
            profilePic = nil
        }
        
    }
        
    enum UserGenre: Int {
        case male = 0
        case female
        case other
                
        func string() -> String? {
            switch self {
            case .male:
                return "Male"
            case .female:
                return "Female"
            default:
                return nil
            }
        }
    }
    
    enum BodyShape {
        case apple
        case pear
        case sandTimer
    }
    
}
