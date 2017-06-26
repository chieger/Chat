//
//  ChatCell.swift
//  parse_demo_01
//
//  Created by Charles Hieger on 6/26/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {


   @IBOutlet weak var usernameLabel: UILabel!

   @IBOutlet weak var chatTextLabel: UILabel!




   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
