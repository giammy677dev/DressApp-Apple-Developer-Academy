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
    @IBOutlet public weak var cardView: UIView!
    let overlay = UIVisualEffectView() //constant for the blur effect of the card
    let manager = CLLocationManager()
    var celsius: Float = 8.5
    var summary: String? = ""
    var location: String = ""
    var fahrenheit : Float?
    var latitude: String?
    var longitude : String?
    var elegant: Bool = Wardrobe.shared.chooseElegant
    var cold: Bool = Wardrobe.shared.chooseCold
    
    
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
        
        overlay.frame = self.view.frame
        view.insertSubview(overlay, at: 0)
        
//        var dailyOutfit = Wardrobe.shared.getOutfit(elegant: false, cold: false)
       
        
        /*
         ONLY FOR PRESENTATION
         */
        self.weatherImageView.image = self.icons["partly-cloudy-day"]
        self.forecastLabel.text = "Humid and Mostly Cloudy" + "\n" + self.celsius.description + "°C"
        self.locationLabel.text = "Napoli"
        
//        To enable the swipe gesture
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(myviewTapped(sender:)))
        swipeGesture.direction = .down
        cardView.addGestureRecognizer(swipeGesture)
        cardView.isUserInteractionEnabled = true
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        elegant = Wardrobe.shared.chooseElegant
        cold = Wardrobe.shared.chooseCold
        
        if tabBarController?.selectedIndex != 0 {
            UIView.animate(withDuration: 0){
                self.cardView.transform = CGAffineTransform(translationX: 0, y: 0)
            }
            locationLabel.alpha = 1
            forecastLabel.alpha = 1
            weatherImageView.alpha = 1
            avatarImageView.alpha = 1
            trousersImageView.alpha = 1
            shirtImageView.alpha = 1
            tShirtImageView.alpha = 1
            shoesImageView.alpha = 1
            dressImageView.alpha = 1
            
            overlay.effect = nil
        }
        
        print("viewWillAppear")
        
        if elegant {
//            shirtImageView.image = Shirt(color: Color.white, material: Material.cotton, description: "White shirt", elegant: true, model: Model.long).image()
//            dressImageView.image = Dress(color: Color.blue, material: Material.cotton, description: "Dark dress", elegant: true).image()
//            shoesImageView.image = Shoes(color: Color.black, material: .cotton, description: "elegant shoes", elegant: true).image()
//            trousersImageView.image = Trousers(color: Color.blue, material: Material.cotton, description: "", elegant: true, model: Model.long).image()
        } else if !elegant && !cold {
//            dressImageView.image = nil
//            trousersImageView.image = Trousers(color: Color.black, material: Material.cotton, description: "Black pants bought on 12/12/17", elegant: true, model: Model.long).image()
//            shirtImageView.image = Shirt(color: Color.white, material: Material.cotton, description: "White shirt", elegant: true, model: Model.long).image()
//            shoesImageView.image = Shoes(color: Color.red, material: Material.cotton, description: "Converse", elegant: false).image()
        }
        else if cold {
//            dressImageView.image = nil
//            shoesImageView.image = Shoes(color: Color.saddleBrown, material: Material.cotton, description: "", elegant: false).image()
//            trousersImageView.image = Trousers(color: Color.indigo, material: Material.wool, description: "", elegant: true, model: Model.long).image()
//            shirtImageView.image = Sweater(color: Color.putty, material: Material.cashmere, description: "", elegant: false, model: SweaterModels.pullover).image()
        }
        
        
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
                        //self.celsius = (self.fahrenheit! - 37) / 1.8
                        self.celsius = 8.0

//                        self.forecastLabel.text = result.summary + "\n" + self.celsius.description + "°C"
//                        self.weatherImageView.image = self.icons["partly-cloudy-day"]
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
    
    @IBAction func liftTheFiltersCard(_ sender: UIButton) {
        
        overlay.effect = UIBlurEffect(style: .dark)
        locationLabel.alpha = 0.3
        forecastLabel.alpha = 0.3
        weatherImageView.alpha = 0.3
        avatarImageView.alpha = 0.3
        trousersImageView.alpha = 0.3
        shirtImageView.alpha = 0.3
        tShirtImageView.alpha = 0.3
        shoesImageView.alpha = 0.3
        dressImageView.alpha = 0.3
            UIView.animate(withDuration: 0.3){ self.cardView.transform = CGAffineTransform(translationX: 0, y: -201)}
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

@objc func myviewTapped(sender: UITapGestureRecognizer) {
    
    locationLabel.alpha = 1
    forecastLabel.alpha = 1
    weatherImageView.alpha = 1
    avatarImageView.alpha = 1
    trousersImageView.alpha = 1
    shirtImageView.alpha = 1
    tShirtImageView.alpha = 1
    shoesImageView.alpha = 1
    dressImageView.alpha = 1
    
    overlay.effect = nil
    
    UIView.animate(withDuration: 0.3){
        self.cardView.transform = CGAffineTransform(translationX: 0, y: 0)
        print ("tap registrata")
    }
}

}

/*
 Future updates:
 Check if there's internet. If no connection => last weather
 
 */
