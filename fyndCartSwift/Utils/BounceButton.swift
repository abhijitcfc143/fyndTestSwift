//
//  BounceButton.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 26/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

class BounceButton: UIButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
    
}

class BounceButtonImageRightAllign: BounceButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil{
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
        }
    }
}

extension UIButton{
    func addBorderShadowButton(color : UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 3.0
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
