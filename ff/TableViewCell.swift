//
//  TableViewCell.swift
//  ff
//
//  Created by iMac on 6/1/18.
//  Copyright © 2018 iMac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mylabel: UILabel!
    override func awakeFromNib() {
        weak var mytext: UILabel!
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
