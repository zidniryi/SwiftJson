//
//  ViewControllerTableViewCell.swift
//  SwiftJson
//
//  Created by hint on 08/11/18.
//  Copyright © 2018 ZidniRyi. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {
    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtBio: UITextView!
    @IBOutlet weak var lblTeam: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
