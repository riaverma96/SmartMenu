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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    // Only update current location once at start up
    var currentLocation = false
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (currentLocation == false) {
            
            let location = locations[0]
            let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
            let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            let region: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, span)
            
            self.mapView.setRegion(region, animated: true)
            self.mapView.showsUserLocation = true
            currentLocation = true
        }
    }
            
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        readRestaurantDataAndAllPins()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        self.doLayout()
        self.loadAnnotations()
    }
    
    
    
    // Handle Map View:
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation.isKind(of: MKUserLocation.self) {  //Handle user location annotation..
            return nil  //Default is to let the system handle it.
        }
        
        if !annotation.isKind(of: RestaurantPin.self) {  //Handle non-ImageAnnotations..
            var pinAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "DefaultPinView")
            if pinAnnotationView == nil {
                pinAnnotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "DefaultPinView")
            }
            return pinAnnotationView
        }
        
        //Handle ImageAnnotations..
        var view: RestaurantPinView? = mapView.dequeueReusableAnnotationView(withIdentifier: "restaurantPin") as? RestaurantPinView
        if view == nil {
            view = RestaurantPinView(annotation: annotation, reuseIdentifier: "restaurantPin")
        }
        
        let annotation = annotation as! RestaurantPin
        //view?.image = annotation.image
        view?.image = UIImage(named: "frontbackground.jpg")
        view?.annotation = annotation
        
        return view
    }

    
    
    
    
    
    
    // Annotation Related Code Below:
    
    func doLayout() {
        self.view.addSubview(self.mapView)
        self.mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        //self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.mapView.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func loadAnnotations() {
        let request = NSMutableURLRequest(url: URL(string: "https://i.imgur.com/zIoAyCx.png")!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if error == nil {
                
                let coordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(33, -88)
                let annotation = RestaurantPin(title: "", coordinate: coordinate, apiKey : "", logoURL : "")
                annotation.coordinate = CLLocationCoordinate2DMake(43.761539, -79.411079)
                //annotation.image = UIImage(data: data!, scale: UIScreen.main.scale)
                annotation.title = "Toronto"
                
                DispatchQueue.main.async {
                    self.mapView.addAnnotation(annotation)
                }
            }
        }
        dataTask.resume()
    }
    
    
    
    
    
    
    
    // Loading Data Below:
    
    func readJSONObject(object: [String: AnyObject]) {
        guard let restaurants = object["restaurants"] as? [[String: AnyObject]] else { return }
        for restaurant in restaurants {
            
            guard let name = restaurant["name"] as? String,
                let restaurantAPI = restaurant["apiKey"] as? String,
                let logoURL = restaurant["logoUrl"] as? String,
                let latitude = restaurant["latitude"] as? Double,
                let longitude = restaurant["longitude"] as? Double
                else { break }
            
            let restaurantCoordinate : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            mapView.addAnnotation(RestaurantPin(title: name, coordinate : restaurantCoordinate, apiKey: restaurantAPI, logoURL: logoURL))
        }
    }
    
    func readRestaurantDataAndAllPins() {
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
            print("Error in readRestaurantDataAndAllPins() function: ", error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
