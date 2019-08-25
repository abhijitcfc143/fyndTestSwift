//
//  ProductColletionViewCell.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 24/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

class ProductColletionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.containerView.addBorderShadow(color: UIColor.black)        
    }

}

extension UIView{
    
    func addBorderShadow(color : UIColor)  {
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
    }
    
}
