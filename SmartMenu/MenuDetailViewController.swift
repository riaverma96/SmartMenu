//
//  MenuDetailViewController.swift
//  SmartMenu
//
//  Created by shuang on 10/24/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
    
    var detail = Meal(name:"Unknown",price:"Unknown",description:"")
    @IBOutlet weak var Spicy_type: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var sweet_label: UILabel!
    @IBOutlet weak var spicy_label: UILabel!
    @IBOutlet weak var allergic_label_one: UILabel!
    @IBOutlet weak var sweet_choice: UISegmentedControl!
    @IBOutlet weak var spicy_choice: UISegmentedControl!
    @IBOutlet weak var allergic_one: UISegmentedControl!
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
 
    @IBAction func spicy_choice_action(_ sender: UISegmentedControl) {
        switch spicy_choice.selectedSegmentIndex
        {
        case 0:
            detail?.setPreference(value: "1",key: "Spicy_choice")
        case 1:
            detail?.setPreference(value: "2",key: "Spicy_choice")
        case 2:
            detail?.setPreference(value: "3",key: "Spicy_choice")
        default:
            break;
        }
    }

    @IBAction func sweet_choice_action(_ sender: UISegmentedControl) {
        switch sweet_choice.selectedSegmentIndex
        {
        case 0:
            detail?.setPreference(value: "1",key: "Sweet_choice")
        case 1:
            detail?.setPreference(value: "2",key: "Sweet_choice")
        case 2:
            detail?.setPreference(value: "3",key: "Sweet_choice")
            dump(detail?.preference)
        default:
            break;
        }
    }
    @IBAction func allergic_one_action(_ sender: UISegmentedControl) {
        switch allergic_one.selectedSegmentIndex
        {
        case 0:
            detail?.setPreference(value: "Yes",key: "Peanut_Allergic")
        case 1:
            detail?.setPreference(value: "No",key: "Peanut_Allergic")
            dump(detail?.preference)
        default:
            break;
        }
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
