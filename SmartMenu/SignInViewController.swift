//
//  SignInViewController.swift
//  SmartMenu
//
//  Created by Xiaoyu Yang on 11/8/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var signInTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be  recreated.
    }
    
    @IBAction func signInFunction(_ sender: Any) {
        if let email = signInTextField.text, let pass = passWordTextField.text
        {
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                if let u = user{
                    self.performSegue(withIdentifier: "Map", sender: self)
                }
                else {
                    //error
                }
            })
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
