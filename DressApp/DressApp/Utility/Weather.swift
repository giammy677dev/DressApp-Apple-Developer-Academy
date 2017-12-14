//
//  Weather.swift
//  DressApp
//
//  Created by Francesco Picerno on 13/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation

//
//  Wheater.swift
//  tryMeteo
//
//  Created by Francesco Picerno on 11/12/17.
//  Copyright © 2017 Francesco Picerno. All rights reserved.
//

import Foundation

struct Weather {
    let summary: String
    let icon: String
    let temperature: Float
    
    enum SeralizationError:Error {
        case missing(String)
        case invalid (String,Any)
    }
    
    init(json:[String:Any]) throws {
        
        guard let summary = json["summary"] as? String else {throw SeralizationError.missing("summary is missing")}
        
        guard let icon = json["icon"] as? String else {throw SeralizationError.missing("icon is missing")}
        
        guard let temperature = json["temperature"] as? Float else {throw SeralizationError.missing("temp is missing")}
        
        self.summary = summary
        self.icon = icon
        self.temperature = temperature
        
    }
    
    
    static let basePath = "https://api.darksky.net/forecast/9332038d792ef636bbbbc7aed7f644e3/"
    
    static func forecast (withLocation location:String, completion: @escaping ([Weather]) -> ()) {
        
        let url = basePath + location
        let request = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: request) { (data:Data?, response:URLResponse?, error:Error?) in
            
            var forecastArray:[Weather] = []
            
            if let data = data {
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        if let dailyForecasts = json["currently"] as? [String:Any] {
                            if let weatherObject = try? Weather(json: dailyForecasts) {
                                forecastArray.append(weatherObject)
                            }
                            
                            
                        }
                    }
                }catch {
                    print(error.localizedDescription)
                }
                
                completion(forecastArray)
                
            }
        }
        
        task.resume()
    }
    
    
}



