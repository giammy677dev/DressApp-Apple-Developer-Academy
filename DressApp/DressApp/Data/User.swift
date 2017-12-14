//
//  User.swift
//  DressApp
//
//  Created by Stefano Formicola on 14/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

class User {
    
    static let shared = User()
    
    var genre: UserGenre?
    var bodyShape: BodyShape?
    var dateOfBirth: Date?
    var age: Int {
        let today = Date()
        let gregorian = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let ageComponents = gregorian?.components([.month, .day, .year], from: dateOfBirth!, to: today, options:[])
        
        return (ageComponents?.year!)!
    }
    var firstName: String?
    var secondName: String?
    
    
    private init() {}
    
    func setUserInfo(genre: UserGenre, bodyShape: BodyShape, dateOfBirth: Date, firstName: String, secondName: String) {

        self.genre = genre
        self.bodyShape = bodyShape
        self.dateOfBirth = dateOfBirth
        self.firstName = firstName
        self.secondName = secondName
        
    }
    
    
    
    enum UserGenre {
        case male
        case female
    }
    
    enum BodyShape {
        case apple
        case pear
        case sandTimer
    }
    
}
