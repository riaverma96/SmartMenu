//
//  MenuTableViewController.swift
//  SmartMenu
//
//  Created by shuang on 10/15/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    var meals = [Meal]()
    var names = [String]()
    var prices = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        //loadSampleMeals()
            // Do any additional setup after loading the view, typically from a nib.
        /*
            do {
                let file = Bundle.main.url(forResource: "menu", withExtension: "json")
                if (file != nil) {
                    let data = try Data(contentsOf: file!)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if object is [String: AnyObject] {
                        print("MenuTableViewController - json is a dictionary")
                        //readJSONObject(object: dictionary)
                    } else if json is [Any] {
                        if let tm = json as? NSArray {
                            var categoryList = [String]()
                            for obj in tm {
                                //print("inside loop")
                                if let dict = obj as? NSDictionary {
                                    categoryList.append(dict["name"] as! String)
                                    if let items = dict["items"] as? NSArray {
                                        print("---------------MenuTableViewController-----------------")
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
       */
    }
    
//    func readJSONObject(object: [String: AnyObject]) {
//        guard let items = object["items"] as? [[String: AnyObject]] else { return }
//        for item in items {
//            guard let name = item["name"] as? String,
//                let price = item["baseprice"] as? String else { break }
//
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MenuTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of MenuTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
        //print (meal)
        //let mealname = names[indexPath.row]
        //let mealprice = prices[indexPath.row]
        
        cell.name.text = meal.name
        cell.price.text = meal.price
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let navigationController = segue.destination as? UINavigationController {
            let childViewController = navigationController.topViewController as? MenuDetailViewController
        let indexPath : NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        //let DestinationViewController = segue.destination as! MenuDetailViewController
        var subcatogary : Meal
        subcatogary = meals[indexPath.row]
        childViewController?.detail = subcatogary
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
//    private func loadSampleMeals() {
//
//        guard let meal1 = Meal(name: "Grilled Chicken Salad",price:"6.99") else {
//            fatalError("Unable to instantiate meal1")
//        }
//
//        guard let meal2 = Meal(name: "Buffalo Chicken Salad",price:"6.99") else {
//            fatalError("Unable to instantiate meal2")
//        }
//
//        guard let meal3 = Meal(name: "Chef Salad",price:"6.99") else {
//            fatalError("Unable to instantiate meal2")
//        }
//
//
//        guard let meal4 = Meal(name: "Taco Salad",price:"6.99") else {
//            fatalError("Unable to instantiate meal2")
//        }
//
//        guard let meal5 = Meal(name: "Side Salad",price:"3.49") else {
//            fatalError("Unable to instantiate meal2")
//        }
//
//
//        /*
//         Read Json File Here
//         */
//        //names += ["aa","bb"]
//        //prices += ["cc","dd"]
//
//
//        meals += [meal1, meal2, meal3, meal4, meal5]
//    }
}

