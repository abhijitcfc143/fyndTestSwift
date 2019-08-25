//
//  ProductSection.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 23/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation


class ProductSection {
    
    var sectionIndex : Int?
    var sectionTitle : String?
    var arrays : [Product]?
    var productImages : [String]?
    var sectionImage : String!
    var isSectionExpanded : Bool?    
    var selectedSegmentIndex : Int?
    var sectionIndexExpanded : Int?
    
    init() {
        
    }
    
    init(sectionIndex : Int,sectionTitle : String?,arrays : [Product]?,sectionImage : String,isSectionExpanded : Bool,selectedSegmentIndex : Int?,sectionIndexExpanded : Int?) {
        self.sectionIndex = sectionIndex
        self.sectionTitle = sectionTitle
        self.arrays = arrays
        self.sectionImage = sectionImage
        self.isSectionExpanded = isSectionExpanded
        self.selectedSegmentIndex = selectedSegmentIndex
        self.sectionIndexExpanded = sectionIndexExpanded
    }
}
