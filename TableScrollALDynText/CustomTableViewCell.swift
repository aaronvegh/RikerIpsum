//
//  CustomTableViewCell.swift
//  TableScrollALDynText
//
//  Created by Aaron Vegh on 2014-08-14.
//  Copyright (c) 2014 Aaron Vegh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textContentLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
