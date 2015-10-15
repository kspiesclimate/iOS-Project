//
//  FieldCell.swift
//  testOpMngmt
//
//  Created by Lindsey Boyden on 10/15/15.
//  Copyright © 2015 Katie Spies. All rights reserved.
//

import UIKit

class FieldCell: UITableViewCell {

    @IBOutlet weak var acresLabel: UILabel!
 
    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
