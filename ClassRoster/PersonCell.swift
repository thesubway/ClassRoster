//
//  PersonCell.swift
//  ClassRoster
//
//  Created by Dan Hoang on 7/25/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet var imageInCell: UIImageView!
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
