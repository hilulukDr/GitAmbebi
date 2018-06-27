//
//  MenuListCollectionViewCell.swift
//  ff
//
//  Created by iMac on 6/1/18.
//  Copyright © 2018 iMac. All rights reserved.
//

import UIKit

class MenuListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var MainPageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func commoninit(name: String){
    MainPageLabel.text = name
    
    }
    
}
