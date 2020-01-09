//
//  FeedTableViewCell.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 26/09/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func set(data:FakeData, color: UIColor) {
        self.title.text = data.name
        backgroundColor = color
    }
    
}
