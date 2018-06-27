//
//  TableViewCellHighDesign.swift
//  ff
//
//  Created by iMac on 5/30/18.
//  Copyright © 2018 iMac. All rights reserved.
//

import UIKit

class TableViewCellHighDesign: UITableViewCell {
    
    
    @IBOutlet weak var ImageCellView: UIImageView!

    @IBOutlet weak var HighCellDateTime: UILabel!
    
    @IBOutlet weak var HighCellPostInfo: UILabel!
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
var sentData2: UIImage?
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func commonInit(title: String, Date: String,image : UIImage) {
        HighCellDateTime.text = title
        HighCellPostInfo.text = Date
        ImageCellView.image = sentData2
    
    }

    
}
