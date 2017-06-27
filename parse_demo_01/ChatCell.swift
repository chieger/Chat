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

   @IBOutlet weak var bubbleView: UIView!



   override func awakeFromNib() {
        super.awakeFromNib()
        bubbleView.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
