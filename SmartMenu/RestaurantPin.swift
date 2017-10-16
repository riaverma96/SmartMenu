//
//  RestaurantPin.swift
//  SmartMenu
//
//  Created by Ria Verma on 10/15/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import MapKit

class RestaurantPin : NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title : String, subtitle : String, coordinate : CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
