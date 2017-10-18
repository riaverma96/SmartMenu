//
//  MenuViewController.swift
//  SmartMenu
//
//  Created by Xiaoyu Yang on 10/16/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
            do {
                let file = Bundle.main.url(forResource: "menu", withExtension: "json")
                if (file != nil) {
                    let data = try Data(contentsOf: file!)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    if let dictionary = object as? [String: AnyObject] {
                        print("json is a dictionary")
                        readJSONObject(object: dictionary)
                    } else if json is [Any] {
                        if let tm = json as? NSArray {
                            for obj in tm {
                                print("inside loop")
                                if let dict = obj as? NSDictionary {
                                    if let items = dict["items"] as? NSArray {
                                        print("--------------------------------")
                                        for item in items {
                                            let tmp = item as! NSDictionary
                                            let price = tmp["basePrice"]
                                            let name = tmp["name"]
                                            
                                            // when use the name and price, remember to put a ! after the variable
                                            
                                            // name
                                            
                                            // eg. name!  price!
                                            
                                            print("name = ", name!)
                                            
                                            print("price = ", price!)
                                            
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
    
        func readJSONObject(object: [String: AnyObject]) {
            guard let items = object["items"] as? [[String: AnyObject]] else { return }
            for item in items {
                guard let name = item["name"] as? String,
                let price = item["baseprice"] as? Double else { break }
                print("name = ", name)
                print("price = ", price)
            }
        }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
