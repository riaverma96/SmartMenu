//
//  Meal.swift
//  SmartMenu
//
//  Created by Sunil Timalsina on 10/16/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import Foundation

class Meal{
    var category:String
    var name:String
    var price:String
    var description:String
    var preference : [String:String]
    init?(category: String,name: String, price:String, description:String,preference:[String:String]=[String:String]()) {
        if name.isEmpty || price.isEmpty {
            return nil
        }
        self.category = category
        self.name = name
        self.price = price
        self.description = description
        self.preference = preference
    }
    
    func setPreference(value:String,key:String) -> Void {
        //if self.preference.values.contains(value){
        self.preference[key] = value
        //}
        //else{
            //self.preference.updateValue(value,forKey: key)
        //}
    }

}
