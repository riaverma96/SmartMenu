//
//  MenuDetailViewController.swift
//  SmartMenu
//
//  Created by shuang on 10/24/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    @IBOutlet weak var spicy: UISlider!
    var detail = Meal(name:"Unknown",price:"Unknown",description:"")
   
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = (detail?.name)!+"\nDecription:"+(detail?.description)!
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        label.sizeToFit()
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
