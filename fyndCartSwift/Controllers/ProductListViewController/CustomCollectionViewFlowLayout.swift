//
//  CustomCollectionViewFlowLayout.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 24/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {

    var numberOfItems = 4
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height
    let innerSpace: CGFloat = 0
    let numberOfCellsOnRow: CGFloat = 3
    
    override init() {
        super.init()
        self.minimumLineSpacing = innerSpace
        self.minimumInteritemSpacing = innerSpace
        self.scrollDirection = .horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    func itemWidth() -> CGFloat {
        //        if numberOfItems > 5 && numberOfItems <= 8{
        //            if numberOfItems == 6 {
        //                return ((viewWidth)/3)-self.innerSpace
        //            }
        //            else if numberOfItems == 7{
        //                return ((viewWidth-30)/3)-self.innerSpace
        //            }
        //            return ((viewWidth)/self.numberOfCellsOnRow)-self.innerSpace
        //        }
        //        else{
        if numberOfItems <= 6{
            return ((viewWidth)/3)-self.innerSpace
        }else if numberOfItems > 6 {
            return ((viewWidth)/3)-self.innerSpace
        }else{
            return ((viewWidth)/numberOfCellsOnRow)-self.innerSpace
        }
        
        
//        if numberOfItems > 4 {
//            return ((viewWidth-30)/self.numberOfCellsOnRow)-self.innerSpace
//        }
//        return (viewWidth/CGFloat(numberOfItems))-self.innerSpace
        //        }
    }
    
    func itemHeight() -> CGFloat{
        
        return ((viewWidth-30)/self.numberOfCellsOnRow)-self.innerSpace + 100
    }
    
    override var itemSize: CGSize {
        set {
            if numberOfItems == 6 {
                self.itemSize = CGSize(width:itemWidth(), height:itemHeight())
            }
            self.itemSize = CGSize(width:itemWidth(), height:itemHeight())
        }
        get {
            if numberOfItems == 6 {
                return CGSize(width:itemWidth(), height:itemHeight())
            }
            return CGSize(width:itemWidth(),height:itemHeight())
        }
    }
}
