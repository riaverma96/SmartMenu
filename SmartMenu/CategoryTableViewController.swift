//
//  CategoryTableViewController.swift
//  SmartMenu
//
//  Created by Sunil Timalsina on 10/18/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {var meals = [Meal]()
    var names = [String]()
    var prices = [String]()
    var categoryList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleMeals()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            let file = Bundle.main.url(forResource: "menu", withExtension: "json")
            if (file != nil) {
                let data = try Data(contentsOf: file!)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if object is [String: AnyObject] {
                    print("CategoryTableViewController - json is a dictionary")
                    //readJSONObject(object: dictionary)
                } else if json is [Any] {
                    if let tm = json as? NSArray {
                        //var categoryList = [String]()
                        for obj in tm {
                            //print("inside loop")
                            if let dict = obj as? NSDictionary {
                                categoryList.append(dict["name"] as! String)
                                if let items = dict["items"] as? NSArray {
                                    print("---------------CategoryTableViewController-----------------")
                                    for item in items {
                                        let tmp = item as! NSDictionary
                                        let price = tmp["basePrice"]
                                        let name = tmp["name"]
                                        
                                        // when use the name and price, remember to put a ! after the variable
                                        
                                        // name
                                        
                                        // eg. name!  price!
                        
                                        let myName = name! as! String
                                        let myPrice = ((price!) as AnyObject).stringValue
                                        
                                        print("name = ", myName)
                                        print("price = ", myPrice ?? 1)
                                        
                                        guard let meal = Meal(name: myName, price: myPrice!) else {return}
                                        
                                        print("item",meal)
                                        
                                        meals.append(meal)
                                        
                                    }
                                    
                                } else {
                                    
                                    print("deaddead")
                                    
                                }
                                
                            }
                            
                        }
                        
                        print("json is a [NSArray]")
                        
                    } else {
                        
                        print("dead")
                        
                    }
                    print("json is an array")
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CategoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CategoryTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of CategoryTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
//        for count in categoryList
//        {
//            cell.CategoryName.text = count
//            return cell
//        }
        
        print("item Category", indexPath.row, categoryList[indexPath.row])
        let cateName = categoryList[indexPath.row]
        let meal = meals[indexPath.row]
        //print (meal)
        //let mealname = names[indexPath.row]
        //let mealprice = prices[indexPath.row]
        cell.CategoryName.text = cateName
        //cell.price.text = meal.price
        return cell
        
//        cell.CategoryName.text = categoryList[indexPath.row]
//        return cell
    }
    
    
}


