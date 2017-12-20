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
        let ageComponents = gregorian?.components([.month, .day, .year], from: dateOfBirth!, to: today, options:[])

        return (ageComponents?.year!)!
    }
    var name: String?
//    var profilePic: UIImage?
//
//
    /*
     As a singleton class, the init method is private and all properties of the singleton are optionals and set to nil.
     
     setUserInfo should be called at the first launch of the application to set all User's properties and in the Settings page
     to edit them.
     */
    
    private init() {
        self.load()
    }
    
//    required init(from decoder: Decoder) throws {
//
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        let name = try values.decode(String?.self, forKey: .name)
//        let genre = try values.decode(UserGenre?.self, forKey: .genre)
//        let dateOfBirth = try values.decode(Date?.self, forKey: .dateOfBirth)
//        let bodyShape = try values.decode(BodyShape?.self, forKey: .bodyShape)
//
//        self.setUserInfo(genre: genre, bodyShape: bodyShape, dateOfBirth: dateOfBirth, name: name)
//
//        print("Initialized")
////        self.init()
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(genre, forKey: .genre)
//        try container.encode(bodyShape, forKey: .bodyShape)
//        try container.encode(name, forKey: .name)
//        try container.encode(dateOfBirth, forKey: .dateOfBirth)
//
//
//        print("Encoded")
//    }

    enum CodingKeys: String, CodingKey {
        case genre
        case bodyShape
        case dateOfBirth = "birthday"
        case name
        case profilePic
    }

    func save() {
        let jsonEncoder = JSONEncoder()
        if let savedData = try? jsonEncoder.encode(User.shared) {
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "shared")
        } else {
            print("Failed to save data.")
        }
        print("Saved")
    }
    
    func load() {
        
        print("Loading")
        
        let defaults = UserDefaults.standard
        
        if let savedData = defaults.object(forKey: "shared") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                let savedUser = try jsonDecoder.decode(User.self, from: savedData)
    //            setUserInfo(genre: savedUser.genre, bodyShape: savedUser.bodyShape, dateOfBirth: savedUser.dateOfBirth, name: savedUser.name)
            } catch {
                print("Failed to load data.")
            }
        }
        
        print("Loaded")
    }
    
    func setUserInfo(genre: UserGenre?, bodyShape: BodyShape?, dateOfBirth: Date?, name: String?) {

        self.genre = genre ?? self.genre
        self.bodyShape = bodyShape ?? self.bodyShape
        self.dateOfBirth = dateOfBirth ?? self.dateOfBirth
//        self.name = name ?? self.name
        
//        UserDefaults.standard.set(name, forKey: "username") //Ho aggiunto le seguenti 3 righe
//        UserDefaults.standard.set(age, forKey: "birthdate")
//        UserDefaults.standard.set(profilePic, forKey: "profile pic")
        
//        if genre == .male {
//            profilePic = #imageLiteral(resourceName: "Man Profile Pic")
//        } else {
//            profilePic = #imageLiteral(resourceName: "Woman Profile Pic")
//        }
        
//        save()
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

