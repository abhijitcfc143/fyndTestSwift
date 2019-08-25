//
//  Product.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 23/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation
import ObjectMapper

class Objects: NSObject,Mappable {
    
    var objectLists : [Product]?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    func mapping(map: Map) {
        objectLists <- map["objects"]
    }
}
