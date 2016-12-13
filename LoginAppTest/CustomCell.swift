//
//  CustomCell.swift
//  LoginAppTest
//
//  Created by Lê Hà Thành on 12/12/16.
//  Copyright © 2016 Lê Hà Thành. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImage.layer.cornerRadius = 40
        avatarImage.clipsToBounds = true
    }

    
}
