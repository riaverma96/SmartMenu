//
//  TableViewCell.swift
//  SmartMenu
//
//  Created by Sunil Timalsina on 10/16/17.
//  Copyright © 2017 Hex. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
   
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

