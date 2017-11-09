//
//  MenuDetailViewController.swift
//  SmartMenu
//
//  Created by shuang on 10/24/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit
import Firebase

class MenuDetailViewController: UIViewController {
    
    var detail = Meal(name:"Unknown",price:"Unknown",description:"")
    var order = [Meal]()
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
        label.text = (detail?.name)!+"\n\nDecription: "+(detail?.description)!

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
 
    @IBAction func showAlert(_ sender: UIButton) {
            // create the alert
            let alert = UIAlertController(title: "Congratulations", message: "Your meal is added to basket successfully!", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        order.append(detail!);
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
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vo = segue.destination as! ViewOrderViewController;
//        vo.order = order;
//    }
//    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
