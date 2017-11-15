//
//  ArticleCell.swift
//  Игровые новости
//
//  Created by MacBookPro on 11/14/17.
//  Copyright © 2017 MacBookPro. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var link: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
