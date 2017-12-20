//
//  TodayViewController.swift
//  DressApp
//
//  Created by Stefano Formicola on 20/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class TodayViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
//    let manager = CLLocationManager()
//    
//    @objc(locationManager:didFailWithError:)
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: NSError) {
//        print(error.localizedDescription)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        let manager = CLLocationManager()
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//
//        let myPosition: String = manager.location!.coordinate.latitude.description + "," + manager.location!.coordinate.longitude.description
//        var celsius: Float = 0.0
//        var summary: String? = ""
//        var location: String = ""
//        var result: [Weather]?
//
//        Weather.forecast(withLocation: myPosition) {
//            (results: [Weather]) in result
//
//        }
//            let forecast = result?.last
//            summary = forecast?.summary
//            let fahrenheit = forecast?.temperature
//            if let _ = fahrenheit {
//                celsius = (fahrenheit! - 32) / 1.8
//            }
//            location = "Pippo"
//            //            self.forecastLabel.text = celsius.description + "°C" + "\n" + (forecast?.summary ?? "")
//
//            //            let location = CLLocation(latitude: manager.location!.coordinate.latitude, longitude: manager.location!.coordinate.longitude)
//            //            let geoCoder = CLGeocoder()
//            //            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//            //                var placeMark: CLPlacemark!
//            //                placeMark = placemarks?[0]
//            //
//            //                if let variabile = (placeMark.addressDictionary!["City"] as? NSString) {
//            //                    print(variabile)
//            //                }
//            //            })
//
//
//
//
//        locationLabel.text = location
//        forecastLabel.text = celsius.description + "°C" + "\n" + (summary ?? "")
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/*
 Future updates:
 Check if there's internet. If no connection => last weather
 
 */
