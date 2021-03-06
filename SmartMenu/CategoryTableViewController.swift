//
//  CategoryTableViewController.swift
//  SmartMenu
//
//  Created by Sunil Timalsina on 10/18/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {
    var meals = [[Meal]]()
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
                            print("inside loop")
                            print(obj)
                            var temp_meal = [Meal]()
                            if let dict = obj as? NSDictionary {
                                categoryList.append(dict["name"] as! String)
                                if let items = dict["items"] as? NSArray {
                                    //print("---------------CategoryTableViewController-----------------")
                                    for item in items {
                                        let tmp = item as! NSDictionary
                                        let price = tmp["basePrice"]
                                        let name = tmp["name"]
                                        let description = tmp["description"]
                                        // when use the name and price, remember to put a ! after the variable
                                        
                                        // name
                                        
                                        // eg. name!  price!
                                        
                                        let myName = name! as! String
                                        let myPrice = ((price!) as AnyObject).stringValue
                                        let myDescription = description ?? "Sorry, no description available at this point"
                                        
                                        //print("name = ", myName)
                                        //print("price = ", myPrice ?? 1)
                                       //print("description = ", myDescription ?? "No description")
                                        guard let meal = Meal(category: dict["name"] as! String,name: myName, price: myPrice!, description: myDescription as! String) else {return}
                                      //  if !(myDescription?.isEmpty)!{
                                           // meal.description = myDescription!
                                       //}
                                        print("description = ", myDescription)
                                        //meal.description = myDescription as! String
                                        //print("item",meal)
                                        
                                        temp_meal.append(meal)
                                    }
                                    
                                } else {
                                    
                                    print("deaddead")
                                    
                                }
                                meals.append(temp_meal)
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
        //let meal = meals[indexPath.row]
        //print (meal)
        //let mealname = names[indexPath.row]
        //let mealprice = prices[indexPath.row]
        cell.CategoryName.text = cateName
        //cell.price.text = meal.price
        return cell
        
        //        cell.CategoryName.text = categoryList[indexPath.row]
        //        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow as! NSIndexPath
        var DestinationViewController = segue.destination as! MenuTableViewController
        var subcatogary : [Meal]
        subcatogary = meals[indexPath.row]
        DestinationViewController.meals = subcatogary
    }
}


