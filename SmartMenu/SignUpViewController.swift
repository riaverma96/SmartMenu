//
//  signUpViewController.swift
//  SmartMenu
//
//  Created by Xiaoyu Yang on 11/11/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var signUpTextField: UITextField!
    
    @IBOutlet weak var signUpPassWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpFunction(_ sender: Any) {
        if let email = signUpTextField.text, let pass = signUpPassWord.text
        {
            Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                if let u = user {
                self.performSegue(withIdentifier: "SignIn", sender: self)
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
