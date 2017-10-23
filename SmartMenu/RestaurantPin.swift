//
//  RestaurantPin.swift
//  SmartMenu
//
//  Created by Ria Verma on 10/15/17.
//  Copyright © 2017 Hex. All rights reserved.
//
import MapKit

class RestaurantPin : NSObject, MKAnnotation {
    var title : String?
    var coordinate: CLLocationCoordinate2D
    var apiKey : String?
    var logoURL : String?
    
    init(title : String, coordinate : CLLocationCoordinate2D, apiKey : String, logoURL : String) {
        self.title = title
        self.coordinate = coordinate
        self.apiKey = apiKey
        self.logoURL = logoURL
    }
}
