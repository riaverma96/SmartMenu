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
    var description:String
    init?(name: String, price:String, description:String) {
        if name.isEmpty || price.isEmpty {
            return nil
        }
        self.name = name
        self.price = price
        self.description = description
    }
}
