//
//  MapViewController.swift
//  SmartMenu
//
//  Created by Ria Verma on 10/15/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, span)
        
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        readAllRestaurantData()
    }
            
    func readAllRestaurantData() {
        do {
            
            let file = Bundle.main.url(forResource: "all_atlanta_restaurants", withExtension: "json")
            
            if (file != nil) {
                
                let data = try Data(contentsOf: file!)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let dictionary = object as? [String: AnyObject] {
                    print("MapViewController - json is a dictionary")
                    readJSONObject(object: dictionary)
                } else if json is [Any] {
                    // json is an array
                    print("json is an array")
                    // print(object)
                    
                } else {
                    print("JSON is invalid")
                }
                
            } else {
                print("no file")
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func readJSONObject(object: [String: AnyObject]) {
        
        guard let restaurants = object["restaurants"] as? [[String: AnyObject]] else { return }
        for restaurant in restaurants {
            
            guard let latitude = restaurant["latitude"] as? Double,
            let name = restaurant["name"] as? String,
            let longitude = restaurant["longitude"] as? Double else { break }
            let restaurantLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            map.addAnnotation(RestaurantPin(title: name, subtitle: "", coordinate : restaurantLocation))
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
