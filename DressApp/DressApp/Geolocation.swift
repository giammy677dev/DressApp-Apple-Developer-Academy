//
//  Geolocation.swift
//  DressApp
//
//  Created by Francesco Picerno on 13/12/17.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class Location: UIViewController, CLLocationManagerDelegate {
   
    let manager = CLLocationManager()
    
    
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations[0]
    
    let latitude = location.coordinate.latitude
    let longitude = location.coordinate.longitude
    let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
}
 
//in viewDidLoad
//
//    manager.delegate = self
//    manager.desiredAccuracy=kCLLocationAccuracyBest
//    manager.requestWhenInUseAuthorization()
//    manager.startUpdatingLocation()
//
//    let myPosition : String = manager.location!.coordinate.latitude.description + "," + manager.location!.coordinate.longitude.description
//
//    Weather.forecast(withLocation: myPosition){ (results :[Weather]) in
//    for result in results{
//    print("\(result)\n\n")
//    }
//
//}
//}
}
