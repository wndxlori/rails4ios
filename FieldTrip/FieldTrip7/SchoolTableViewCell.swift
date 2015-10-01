//
//  SchoolTableViewCell.swift
//  FieldTrip7
//
//  Created by tim on 2015-09-18.
//  Copyright © 2015 Sbrew. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var schoolName: UIView!
    @IBOutlet weak var schoolType: UIView!
}
