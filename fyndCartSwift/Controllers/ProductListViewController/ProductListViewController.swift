//
//  ViewController.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 23/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    
    var isListView = false
    var randomShowAnimation = false
    var finalArray = [ProductSection]()
    var buttonTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sendAllAPIRequest()
    }
    @IBAction func editBarButtonItemTapped(_ sender: Any) {
        self.tableView.isEditing = !self.tableView.isEditing
    }
    
    @IBAction func switchButtonTapped(_ sender: Any) {
        isListView = !isListView
        if isListView{
            self.editBarButtonItem.isEnabled = true
        }else{
            self.tableView.isEditing = false
            self.editBarButtonItem.isEnabled = false
            self.editBarButtonItem.customView?.isHidden = true
        }
        self.tableView.reloadData()
        
    }
}

//MARK:- extensions
extension ProductListViewController{
    func setupUI() {
        self.title = "Products"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100
        
//        self.tableView.sectionHeaderHeight = 50
//        self.tableView.estimatedSectionHeaderHeight = UITableView.automaticDimension
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: TableViewCellIds.defaultCellId)
        self.tableView.register(UINib(nibName: TableViewCellIds.productSectionHeaderTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.productSectionHeaderTableViewCell)
        self.tableView.register(UINib(nibName: TableViewCellIds.productSectionHeaderSegementedTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.productSectionHeaderSegementedTableViewCell)
        self.tableView.register(UINib(nibName: TableViewCellIds.listCollectionViewTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIds.listCollectionViewTableViewCell)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.sortByPriceName(_:)), name: NSNotification.Name.init(rawValue: NotificationsNames.sortByPrice), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.screenRotate(_:)), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        if isListView{
            self.editBarButtonItem.isEnabled = true
        }else{
            self.editBarButtonItem.isEnabled = false
            self.editBarButtonItem.customView?.isHidden = true
        }
        
    }

    @objc func screenRotate(_ sender : Notification){
        self.tableView.reloadData()
    }
    
    @objc func sortByPriceName(_ sender : Notification) {
        if let isPriceChange = sender.userInfo?["priceChange"] as? Bool,let section = sender.userInfo?["sectionIndex"] as? Int,let selectedSegmentIndex = sender.userInfo?["selectedSegmentIndex"] as? Int{
            if isPriceChange{
                let sortedAr = self.finalArray[section].arrays?.sorted(by: { (p1, p2) -> Bool in
                    return p1.cost! < p2.cost!
                })
                self.finalArray[section].arrays = sortedAr
            }else{
                let sortedArray = self.finalArray[section].arrays?.sorted {
                    $0.name!.compare($1.name!, options: .numeric) == .orderedAscending
                }
                self.finalArray[section].arrays = sortedArray
            }
            self.finalArray[section].selectedSegmentIndex = selectedSegmentIndex
            self.tableView.reloadSections(IndexSet(integersIn: section...section), with: UITableView.RowAnimation.none)
        }
    }
    
    func sendAllAPIRequest(){
        
        let dispatchGroup = DispatchGroup()
        
        
        dispatchGroup.enter()
        if let jacketsURL = URL(string: apiURLs.jacketsURL){
            self.getJacketsList(url: jacketsURL) {
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        if let polosURL = URL(string: apiURLs.polosURL){
            self.getPolosList(url: polosURL) {
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.enter()
        if let shirtsURL = URL(string: apiURLs.shirtsURL){
            self.getShirtsList(url: shirtsURL) {
                dispatchGroup.leave()
            }
        }
        
        /*
        dispatchGroup.enter()
        if let sweatShirtsURL = URL(string: apiURLs.sweatShirtsURL){
            self.getProductList(url: sweatShirtsURL) {
                dispatchGroup.leave()
            }
        }*/
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            let unsortedAr = self.finalArray
            var sortedArr = [ProductSection]()
            sortedArr = unsortedAr.sorted(by: { (hm1, hm2) -> Bool in
                return (hm1.sectionIndex!) < (hm2.sectionIndex!)
            })
            
            self.finalArray = sortedArr
            self.tableView.reloadData()
        }
    }
}



//MARK:- ExpandableButtonClickedProtocol,TileSelectedProtocol,CropImageDelegate
extension ProductListViewController : ExpandableButtonClickedProtocol,TileSelectedProtocol,CropImageDelegate{

    func tileSelected(indexPath: IndexPath, sectionIndex: Int) {
        if let productImageName = self.finalArray[sectionIndex].arrays?[indexPath.row].productImageUrl,let productName = self.finalArray[sectionIndex].arrays?[indexPath.row].name{
            redirectToShowImageViewController(imageName: productImageName, productName: productName, indexPath: indexPath, sectionIndex: sectionIndex)
        }else{
            if let productName = self.finalArray[sectionIndex].arrays?[indexPath.row].name{
                redirectToShowImageViewController(imageName: "fyndLogo", productName: productName, indexPath: indexPath, sectionIndex: sectionIndex)
            }
        }
        
        randomShowAnimation.toggle()
    }
    
    
    func expandableButton(button: UIButton) {
        let section = button.tag
        self.finalArray[section].sectionIndexExpanded = section
        
        if !finalArray.isEmpty{
            var indexPathArray = [IndexPath]()
            if let productArray = self.finalArray[section].arrays{
                for row in productArray.indices{
                    let indexPath = IndexPath(row: row, section: section)
                    indexPathArray.append(indexPath)
                }
            }
            
            if let expanded = self.finalArray[section].isSectionExpanded{
                self.finalArray[section].isSectionExpanded = !expanded
                
                button.setTitle(expanded ? "Open" : "Close", for: UIControl.State.normal)
                
                if expanded{                    
                    self.tableView.deleteRows(at: indexPathArray, with: UITableView.RowAnimation.fade)
                }else{
                    
                    
                    
                    
                    var indexPathArToDelete = [IndexPath]()
                        for (index,value) in self.finalArray.enumerated(){
                            
                            if index != section && value.isSectionExpanded!{

                                if let productArray = self.finalArray[index].arrays{
                                    
                                    for row in productArray.indices{
                                        
                                        let indexPath = IndexPath(row: row, section: index)
                                        indexPathArToDelete.append(indexPath)
                                        
                                    }
                                    
                                    self.finalArray[index].sectionIndexExpanded = nil
                                    print("Delete \(index) section")
                                    
                                    let c = self.tableView.tableHeaderView
                                                                        
                                    print(c)
                                }
                            }
                        }
                    
                    self.tableView.beginUpdates()
                    self.tableView.insertRows(at: indexPathArray, with: UITableView.RowAnimation.fade)
                    if !indexPathArToDelete.isEmpty{
                        
                        self.tableView.deleteRows(at: indexPathArToDelete, with: UITableView.RowAnimation.fade)
                    }
                    self.tableView.endUpdates()

                }
                
                
                
            }
        }
    }
    
    func setCropImageInCollectionVew(indexPath: IndexPath?, section: Int?, image: UIImage?) {
        if let indexPath = indexPath,let section = section,let image = image{
//            self.finalArray[section].arrays?[indexPath.row].productImageUrl
            //To-Do
            #warning("Check later")
        }
    }
}

//MARK:- Redirection To ViewControllers
extension ProductListViewController{
    
    func redirectToShowImageViewController(imageName : String,productName : String,indexPath : IndexPath,sectionIndex : Int)  {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ViewControllersIds.showImageViewController) as! ShowImageViewController
        vc.modalTransitionStyle = randomShowAnimation ? .flipHorizontal : .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        vc.imageName = imageName
        vc.productName = productName
        vc.indexPath = indexPath
        vc.section = sectionIndex
        self.present(vc, animated: true, completion: nil)
    }
}




