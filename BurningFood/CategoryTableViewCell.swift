//
//  CategoryTableViewCell.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 22/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView_flag: UIImageView!
    
    @IBOutlet weak var lbl_country: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
