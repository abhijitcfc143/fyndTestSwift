//
//  ProductViewController+TableViewCells.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 25/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import Foundation
import UIKit

//MARK:- TableViewCells
extension ProductListViewController{
    func showDefaultCell(indexPath : IndexPath) -> UITableViewCell{
        if let product = self.finalArray[indexPath.section].arrays?[indexPath.row],let isExpandable = self.finalArray[indexPath.section].isSectionExpanded,isExpandable{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.defaultCellId, for: indexPath)
            cell.selectionStyle = .none
            cell.textLabel?.text = product.name
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func showProductSectionHeaderTableViewCell(section : Int) -> ProductSectionHeaderTableViewCell {
        if !finalArray.isEmpty{
            let sectionP = self.finalArray[section]
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.productSectionHeaderTableViewCell) as! ProductSectionHeaderTableViewCell
            cell.selectionStyle = .none
            cell.sectionTitleLabel.text = sectionP.sectionTitle
            cell.expandableButtonDelegate = self
            cell.expandableButton.tag = section
            if let isExpanded = sectionP.isSectionExpanded{
                
                cell.expandableButton.setTitle(isExpanded ? "^" : ">", for: UIControl.State.normal)
            }
            return cell
        }
        
        return ProductSectionHeaderTableViewCell()
    }
    
    func showProductSectionHeaderSegementedTableViewCell(section : Int) -> ProductSectionHeaderSegementedTableViewCell{
        if !finalArray.isEmpty{
            let sectionP = self.finalArray[section]
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.productSectionHeaderSegementedTableViewCell) as! ProductSectionHeaderSegementedTableViewCell
            cell.selectionStyle = .none
            cell.sectionTitle.text = sectionP.sectionTitle
            if let index = sectionP.selectedSegmentIndex{
                cell.segmentedControl.selectedSegmentIndex = index
            }else{
                cell.segmentedControl.selectedSegmentIndex = -1
            }
            
            
            cell.sectionIndex = section
            cell.containerView.backgroundColor = UIColor.black.withAlphaComponent(0.1)
            cell.backgroundColor = UIColor.white
            return cell
        }
        return ProductSectionHeaderSegementedTableViewCell()
    }
    
    func showListCollectionViewTableViewCell(indexPath : IndexPath) -> ListCollectionViewTableViewCell{
        if !finalArray.isEmpty{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIds.listCollectionViewTableViewCell) as! ListCollectionViewTableViewCell
            cell.selectionStyle = .none
            cell.productList = self.finalArray[indexPath.section].arrays
            //            cell.collectionViewHeightConstraint.constant = cell.collectionView.collectionViewLayout.collectionViewContentSize.height
            cell.collectionViewHeightConstraint.constant = 405
            cell.tileSelectedDelegate = self
            cell.productImagesAr = self.finalArray[indexPath.section].productImages
            cell.sectionInt = indexPath.section
            cell.collectionView.reloadData()
            return cell
        }
        
        return ListCollectionViewTableViewCell()
    }
    
}
