//
//  ProductViewController+TableViewDelegates.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 25/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

//MARK:- TableViewDelegates
extension ProductListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if !finalArray.isEmpty{
            if isListView{
                return 3
            }else{
                return finalArray.count
            }
            
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !finalArray.isEmpty{
            if isListView{
                if let count = self.finalArray[section].arrays?.count,let isExpandable = self.finalArray[section].isSectionExpanded,isExpandable{                    
                    if let sectionExpanded = self.finalArray[section].sectionIndexExpanded{
                        return count
                    }
                    self.finalArray[section].isSectionExpanded = false
                    return 0
                }
            }else{
                return 1
            }
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isListView{
            return showDefaultCell(indexPath: indexPath)
        }else{
            return showListCollectionViewTableViewCell(indexPath: indexPath)
        }   
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let product = self.finalArray[indexPath.section].arrays?[indexPath.row],let productUrl = product.productImageUrl,let productName = product.name{
            self.redirectToShowImageViewController(imageName: productUrl, productName: productName, indexPath: indexPath, sectionIndex: indexPath.section)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if !finalArray.isEmpty{
            if isListView{
                let containerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 50))
                containerView.addSubview(showProductSectionHeaderTableViewCell(section: section))
                return containerView
            }else{
                let containerView = UIView()
                containerView.addSubview(showProductSectionHeaderSegementedTableViewCell(section: section))
                return containerView
            }
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if isListView{
            if let product = self.finalArray[sourceIndexPath.section].arrays?[sourceIndexPath.row]{
                self.finalArray[destinationIndexPath.section].arrays?.insert(product, at: destinationIndexPath.row)
                
                self.finalArray[sourceIndexPath.section].arrays?.remove(at: sourceIndexPath.row)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            var row = 0
            if sourceIndexPath.section < proposedDestinationIndexPath.section {
                row = self.tableView(tableView, numberOfRowsInSection: sourceIndexPath.section) - 1
            }
            return IndexPath(row: row, section: sourceIndexPath.section)
        }
        return proposedDestinationIndexPath
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? ListCollectionViewTableViewCell{
            cell.collectionView.reloadData()
            cell.collectionView.contentOffset = .zero
        }
    }
    
}
