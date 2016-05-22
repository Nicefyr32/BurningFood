//
//  LikedCardsTableViewCell.swift
//  BurningFood
//
//  Created by Thomas Rasmussen on 20/05/2016.
//  Copyright © 2016 Thomas Rasmussen. All rights reserved.
//

import UIKit

class LikedCardsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView_meal: UIImageView!
    
    @IBOutlet weak var lbl_mealName: UILabel!
    
    @IBOutlet weak var lbl_category: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
