//
//  paymentViewController.swift
//  SmartMenu
//
//  Created by Xiaoyu Yang on 10/24/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit
import Stripe

class paymentViewController: UIViewController {
    let themeViewController = ThemeViewController()
    let customerContext = MockCustomerContext()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theme = themeViewController.theme.stpTheme
        let config = STPPaymentConfiguration()
        config.additionalPaymentMethods = .all
        config.requiredBillingAddressFields = .none
        config.appleMerchantIdentifier = "dummy-merchant-id"
        let paymentViewController = STPPaymentMethodsViewController(configuration: config,
                                                             theme: theme,
                                                             customerContext: self.customerContext,
                                                             delegate: self)
        let navigationController = UINavigationController(rootViewController: paymentViewController)
        navigationController.navigationBar.stp_theme = theme
        present(navigationController, animated: true, completion: nil)
        
        func paymentMethodsViewControllerDidCancel(_ paymentMethodsViewController: STPPaymentMethodsViewController) {
            dismiss(animated: true, completion: nil)
        }
        
        func paymentMethodsViewControllerDidFinish(_ paymentMethodsViewController: STPPaymentMethodsViewController) {
            paymentMethodsViewController.navigationController?.popViewController(animated: true)
        }
        
        func paymentMethodsViewController(_ paymentMethodsViewController: STPPaymentMethodsViewController, didFailToLoadWithError error: Error) {
            dismiss(animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
