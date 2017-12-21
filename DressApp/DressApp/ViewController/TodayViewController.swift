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
    @IBOutlet weak var trousersImageView: UIImageView!
    @IBOutlet weak var shirtImageView: UIImageView!
    @IBOutlet weak var tShirtImageView: UIImageView!
    @IBOutlet weak var shoesImageView: UIImageView!
    @IBOutlet weak var dressImageView: UIImageView!
    
    let manager = CLLocationManager()
    var celsius: Float = 0
    var summary: String? = ""
    var location: String = ""
    var fahrenheit : Float?
    var latitude: String?
    var longitude : String?
    
    var icons: [String : UIImage] = ["clear-day": #imageLiteral(resourceName: "sun"), "clear-night": #imageLiteral(resourceName: "moon"), "rain": #imageLiteral(resourceName: "rain"), "snow": #imageLiteral(resourceName: "snow"), "sleet": #imageLiteral(resourceName: "rain"), "wind": #imageLiteral(resourceName: "cloudy"), "fog": #imageLiteral(resourceName: "clouds"), "cloudy": #imageLiteral(resourceName: "clouds"), "partly-cloudy-day": #imageLiteral(resourceName: "cloudy"), "partly-cloudy-night": #imageLiteral(resourceName: "cloudy moon")]
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let _: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.locationLabel.text = location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        shirtImageView.image = Shirt(color: .white, material: .cotton, description: nil, elegant: true, model: .long).image()
        
        
        
        }
    
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
                        self.fahrenheit = result.temperature
                        self.celsius = (self.fahrenheit! - 37) / 1.8
                        self.forecastLabel.text = result.summary + "\n" + self.celsius.description + "°C"
                        self.weatherImageView.image = self.icons[result.icon]
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
            self.locationLabel.text = self.location
            
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
