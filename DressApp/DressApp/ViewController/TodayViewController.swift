//
//  TodayViewController.swift
//  DressApp
//
//  Created by Stefano Formicola on 20/12/2017.
//  Copyright © 2017 Checkmate Team. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class TodayViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
   
    let manager = CLLocationManager()
    var celsius: Int = 0
    var summary: String? = ""
    var location: String = ""
    var fahrenheit : Float?
    var latitude: String?
    var longitude : String?

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let _: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy=kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
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
            //            self.forecastLabel.text = celsius.description + "°C" + "\n" + (forecast?.summary ?? "")
            
            //            let location = CLLocation(latitude: manager.location!.coordinate.latitude, longitude: manager.location!.coordinate.longitude)
            //            let geoCoder = CLGeocoder()
            //            geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            //                var placeMark: CLPlacemark!
            //                placeMark = placemarks?[0]
            //
            //                if let variabile = (placeMark.addressDictionary!["City"] as? NSString) {
            //                    print(variabile)
            //                }
            //            })
            
        
        
//
//        locationLabel.text = location
//        forecastLabel.text = celsius.description + "°C" + "\n" + (summary ?? "")
        
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var myPosition: String = ""
        if let loc = manager.location {
            myPosition = loc.coordinate.latitude.description + "," + loc.coordinate.longitude.description
        } else {
            myPosition = "0.000000,0.000000"
        }
        print(myPosition)
        
        Weather.forecast(withLocation: myPosition){ (results :[Weather]) in
            for result in results{
                print("\(result)\n\n")
            }
            let geoCoder = CLGeocoder()
            
            var location: CLLocation?
            if let loc = self.manager.location  {
                location = CLLocation(latitude: loc.coordinate.latitude, longitude: loc.coordinate.longitude)
                self.latitude=loc.coordinate.latitude.description
                self.longitude = loc.coordinate.longitude.description
                print(self.latitude!)
                print(self.longitude!)
                Weather.forecast(withLocation: (self.latitude! + "," + self.longitude!)){ (results :[Weather]) in
                    for result in results{
                        print("\(result)\n\n")
                    }
                }
            } else {
                location = CLLocation(latitude: 0.0, longitude: 0.0)
            }
            
            geoCoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
                
                // Place details
                var placeMark: CLPlacemark!
                placeMark = placemarks?[0]
                if let city = placeMark.addressDictionary!["City"] as? NSString {
                    print(city)
                    self.location = (city as String?)!
                }
            })
            
//            let forecast = results.last
//           self.summary = forecast?.summary
//            self.fahrenheit = (forecast?.temperature)!
//           if let _ = self.fahrenheit {
//                self.celsius = Int((self.fahrenheit! - 32) / 1.8)
//                        }
//            sleep(1)
////
//            self.locationLabel.text = self.location.description
//            self.forecastLabel.text = self.celsius.description + "°C" + "\n" + (forecast?.summary ?? "")
////
            
         
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
