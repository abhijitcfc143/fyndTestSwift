//
//  ListCollectionViewTableViewCell.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 24/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

protocol TileSelectedProtocol {
    func tileSelected(indexPath : IndexPath,sectionIndex : Int)
}

class ListCollectionViewTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var tileSelectedDelegate : TileSelectedProtocol?
    var sectionInt : Int?
    var productList : [Product]?
    var productImagesAr : [String]?
    var longPressGesture : UILongPressGestureRecognizer?
    
    private let itemsPerRow: CGFloat = 3
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionView.register(UINib(nibName: CollectionViewIds.productColletionViewCell, bundle: nil), forCellWithReuseIdentifier: CollectionViewIds.productColletionViewCell)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture(gesture:)))
        self.collectionView.addGestureRecognizer(self.longPressGesture!)

//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3 + 50)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .horizontal
//        collectionView!.collectionViewLayout = layout
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func handleGesture(gesture: UILongPressGestureRecognizer){
        switch gesture.state {
        case .began:
            guard let selectedIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                break
            }
            collectionView.beginInteractiveMovementForItem(at: selectedIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
}

//MARK:- CollectionViewDelgates
extension ListCollectionViewTableViewCell : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let productCount = self.productList?.count{
            return productCount
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return showProductColletionViewCell(indexPath: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 3.0
//        return CGSize(width: size, height: size + 100)
        return CGSize(width: (UIScreen.main.bounds.width - 10) / 3,height : 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0.0)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let index = self.sectionInt{
            self.tileSelectedDelegate?.tileSelected(indexPath: indexPath, sectionIndex: index)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if let product = self.productList?.remove(at: sourceIndexPath.item){
            self.productList?.insert(product, at: destinationIndexPath.item)
        }
    }
}

//MARK:- ColletionViewCells
extension ListCollectionViewTableViewCell{
    
    func showProductColletionViewCell(indexPath : IndexPath) -> ProductColletionViewCell{
        if let product = self.productList?[indexPath.row]{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewIds.productColletionViewCell, for: indexPath) as! ProductColletionViewCell
            cell.productCostLabel.text = "Rs.\(product.cost!)"
            cell.productNameLabel.text = product.name
            if let url = product.productImageUrl{
                cell.productImageView.downloaded(from: url)
            }
            cell.productImageView.contentMode = .scaleAspectFit
            return cell
        }
        return ProductColletionViewCell()
    }
}
