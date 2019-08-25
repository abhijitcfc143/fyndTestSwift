//
//  ProductViewController+APIRequests.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 25/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

//MARK:- Alamofire requests
extension ProductListViewController{
    
    func getJacketsList(url : URL,completionHandler: @escaping ()->()) {
        Alamofire.request(url)
            .debugLog()
            .validate()
            .responseString { (response) in
                if response.result.isSuccess{
                    if let jacketObject = Mapper<Objects>().map(JSONString: response.result.value!){
                        
                        let section = ProductSection()
                        section.sectionIndex = 0
                        section.sectionTitle = SectionTitles.jackets
                        section.isSectionExpanded = false
                        if let jacketsArray = jacketObject.objectLists{
                            section.arrays = jacketsArray
                            
                            for (index,value) in jacketsArray.enumerated(){
                                section.arrays![index].productImageUrl = ImagesArrayLinks.jacketsArray[index]
                            }
                        }
                        
                        self.finalArray.append(section)
                    }
                    
                    completionHandler()
                }else if response.result.isFailure{
                    completionHandler()
                }
        }
    }
    
    func getPolosList(url : URL,completionHandler: @escaping ()->()) {
        Alamofire.request(url)
            .debugLog()
            .validate()
            .responseString { (response) in
                if response.result.isSuccess{
                    if let polosObject = Mapper<Objects>().map(JSONString: response.result.value!){
                        
                        let section = ProductSection()
                        section.sectionIndex = 1
                        section.sectionTitle = SectionTitles.polos
                        section.isSectionExpanded = false
                        if let polosArray = polosObject.objectLists{
                            section.arrays = polosArray
                            
                            for (index,value) in polosArray.enumerated(){
                                section.arrays![index].productImageUrl = ImagesArrayLinks.polosArray[index]
                            }
                        }
                        
                        self.finalArray.append(section)
                    }
                    
                    completionHandler()
                }else if response.result.isFailure{
                    completionHandler()
                }
        }
    }
    
    func getShirtsList(url : URL,completionHandler: @escaping ()->()) {
        Alamofire.request(url)
            .debugLog()
            .validate()
            .responseString { (response) in
                if response.result.isSuccess{
                    if let shirtObject = Mapper<Objects>().map(JSONString: response.result.value!){
                        
                        let section = ProductSection()
                        section.sectionIndex = 2
                        section.sectionTitle = SectionTitles.shirts
                        section.isSectionExpanded = false
                        if let shirtsArray = shirtObject.objectLists{
                            section.arrays = shirtsArray
                            
                            for (index,value) in shirtsArray.enumerated(){
                                section.arrays![index].productImageUrl = ImagesArrayLinks.shirtsArray[index]
                            }
                        }
                        
                        
                        
                        self.finalArray.append(section)
                    }
                    
                    completionHandler()
                }else if response.result.isFailure{
                    completionHandler()
                }
        }
    }
}
