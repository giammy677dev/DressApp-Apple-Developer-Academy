//
//  User.swift
//  DressApp
//
//  Created by Stefano Formicola on 14/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import UIKit

class User: Codable {
    
    
   static let shared = User()
    
    var genre: UserGenre?
    var bodyShape: BodyShape?
    var dateOfBirth: Date?
    var age: Int {  // Computed property
        let today = Date()
        let gregorian = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let ageComponents = gregorian?.components([.month, .day, .year], from: self.dateOfBirth!, to: today, options:[])

        return (ageComponents?.year!)!
    }
    var name: String?

    
    /*
     As a singleton class, the init method is private and all properties of the singleton are optionals and set to nil.
     
     setUserInfo should be called at the first launch of the application to set all User's properties and in the Settings page
     to edit them.
     */
    
    private init() {
        load()
    }
    
    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(User.shared) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "sharedUserInfo")
        } else {
            print("Failed to save data.")
        }
        print("Saved")
    }

    func load() {

        let defaults = UserDefaults.standard

        if let savedData = defaults.object(forKey: "sharedUserInfo") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                let savedUser = try jsonDecoder.decode(User.self, from: savedData)
                self.name = savedUser.name
                self.genre = savedUser.genre
                self.bodyShape = savedUser.bodyShape
                self.dateOfBirth = savedUser.dateOfBirth
            } catch {
                print("Failed to load data.")
            }


        }
    }
    
    func setUserInfo(genre: UserGenre?, bodyShape: BodyShape?, dateOfBirth: Date?, name: String?) {
        self.genre = genre ?? self.genre
        self.bodyShape = bodyShape ?? self.bodyShape
        self.dateOfBirth = dateOfBirth ?? self.dateOfBirth
        self.name = name ?? self.name
        
        self.save()
    }
    
    func profilePic() -> UIImage? {
        
        switch self.genre {
        case .male?:
            return UIImage(named: "Man Profile Pic")
        case .female?:
            return UIImage(named: "Woman Profile Pic")
        default:
            return nil
        }
        
    }
        
    
}

enum UserGenre: Int, Codable {
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

enum BodyShape: String, Codable {
    case apple = "Apple"
    case pear = "Pear"
    case sandTimer = "Sand Timer"
}

