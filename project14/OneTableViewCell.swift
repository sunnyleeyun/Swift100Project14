//
//  OneTableViewCell.swift
//  project14
//
//  Created by Mac on 2017/11/10.
//  Copyright © 2017年 sunnyleeyun. All rights reserved.
//

import UIKit

class OneTableViewCell: UITableViewCell {

  @IBOutlet weak var imageUrl: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
