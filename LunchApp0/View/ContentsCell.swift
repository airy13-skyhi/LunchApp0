//
//  ContentsCell.swift
//  LunchApp0
//
//  Created by Manabu Kuramochi on 2021/04/12.
//

import UIKit
import Cosmos


class ContentsCell: UITableViewCell {
    
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewView: CosmosView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentImageView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
