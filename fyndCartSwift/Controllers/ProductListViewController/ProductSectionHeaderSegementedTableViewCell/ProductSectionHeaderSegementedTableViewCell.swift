//
//  ProductSectionHeaderSegementedTableViewCell.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 24/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

class ProductSectionHeaderSegementedTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    
    var sectionIndex : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        segmentedControl.selectedSegmentIndex = -1
    }
    
    @IBAction func segmentControlTapped(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            segmentedControl.selectedSegmentIndex = 0
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationsNames.sortByPrice), object: nil, userInfo: ["priceChange" : true,"sectionIndex":sectionIndex,"selectedSegmentIndex":0])
        
        case 1:
            
            segmentedControl.selectedSegmentIndex = 1
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: NotificationsNames.sortByPrice), object: nil, userInfo: ["priceChange" : false,"sectionIndex":sectionIndex,"selectedSegmentIndex":1])
        
        default:
            break;
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
