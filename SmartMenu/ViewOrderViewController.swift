//
//  PayViewController.swift
//  SmartMenu
//
//  Created by Xiaoyu Yang on 10/29/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class ViewOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var order:[String] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    var ref:DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create reference data
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addPost(_ sender: Any) {
        let key = ref?.child("myRestaurant").child("0").child("orders").childByAutoId().key as! String
        
        //        let post = ["restaurantID": 1,
        //                    "itemName": "A burger",
        //                    "itemCount": 2,
        //                    "tableNum or takeOut": 3,
        //                    "spicy":1,
        //                    "Allergic":"Peanut"
        //            ] as [String : Any]
        
        let newOrder = ["item_amount": 1,
                        "item_name": "Chef Salad",
                        "notes": "more tomatoes"] as [String:Any]
        
        let newPreference = ["allergen": "peanut"] as [String:Any]
        
        let newPreference2 = ["spiciness":1] as [String:Any]
        let newPreference3 = ["sweetness":2] as [String:Any]
        let tableID = ["table_number_or_take_out": 2] as [String:Any]
        let uuid = ["key": key] as [String:Any]
        let tableUpdates = ["/restaurants/0/orders/\(key)/table_number_or_take_out": 2]
        let uuidUpdates = ["/restaurants/0/orders/\(key)/key": key]
        ref?.updateChildValues(tableUpdates)
        ref?.updateChildValues(uuidUpdates)

        let childUpdates = ["/restaurants/0/orders/\(key)/item_list/0": newOrder]
        
        ref?.updateChildValues(childUpdates)
        
        let prefUpdates = [ "/restaurants/0/orders/\(key)/item_list/0/preferences/0": newPreference]
        
        ref?.updateChildValues(prefUpdates)
        
        let prefUpdates2 = [ "/restaurants/0/orders/\(key)/item_list/0/preferences/1": newPreference2]
        
        ref?.updateChildValues(prefUpdates2)
        
        let prefUpdates3 = [ "/restaurants/0/orders/\(key)/item_list/0/preferences/2": newPreference3]
        
        ref?.updateChildValues(prefUpdates3)

    }
    
    
    
    //let orderData = ["Chef Salad             1"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return order.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell")
        cell?.textLabel?.text = order[indexPath.row]
        return cell!
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
