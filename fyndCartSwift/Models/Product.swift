//
//  Product.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 23/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: NSObject,Mappable {
    
    var sku : Int?
    var name : String?
    var cost : Int?
    var productImageUrl : String?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        sku  <- map["sku"]
        name  <- map["name"]
        cost  <- map["cost"]
    }
}
