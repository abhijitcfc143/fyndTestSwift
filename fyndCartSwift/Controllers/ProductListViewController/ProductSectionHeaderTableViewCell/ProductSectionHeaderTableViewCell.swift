//
//  ProductSectionHeaderTableViewCell.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 24/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

protocol ExpandableButtonClickedProtocol {
    func expandableButton(button : UIButton)
}

class ProductSectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionTitleLabel: UILabel!
    @IBOutlet weak var expandableButton: UIButton!
    
    var expandableButtonDelegate : ExpandableButtonClickedProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if #available(iOS 10, *) {
            self.sendSubviewToBack(contentView)
        }
    }
    
    
    @IBAction func expandableButtonTapped(_ sender: Any) {
        self.expandableButtonDelegate?.expandableButton(button: sender as! UIButton)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
