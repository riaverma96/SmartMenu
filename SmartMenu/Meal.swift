//
//  Meal.swift
//  SmartMenu
//
//  Created by Sunil Timalsina on 10/16/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import Foundation

class Meal{
    var name:String
    var price:String
    init?(name: String, price:String) {
        if name.isEmpty || price.isEmpty {
            return nil
        }
        self.name = name
        self.price = price
    }
}
