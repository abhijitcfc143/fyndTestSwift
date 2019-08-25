//
//  ShowImageViewController.swift
//  fyndCartSwift
//
//  Created by Abhijit Hadkar on 24/08/19.
//  Copyright © 2019 Abhijit Hadkar. All rights reserved.
//

import UIKit

protocol CropImageDelegate {
    func setCropImageInCollectionVew(indexPath : IndexPath?,section : Int?,image : UIImage?)
}

class ShowImageViewController: UIViewController {
    
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var imageName : String?
    var productName : String?
    var indexPath : IndexPath?
    var section : Int?
    var cropImageDelegate : CropImageDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func doneButtonTapped(_ sender: Any) {
        saveCropedImage()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK:- extensions
extension ShowImageViewController{
    
    func setupUI() {
        
        let scrollViewFrame = scrollView.frame
        let scaleWidth = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth, scaleHeight)
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        scrollView.zoomScale = 1.0
        scrollView.contentMode = UIView.ContentMode.scaleAspectFit
        
        if let url = imageName{
            self.productImageView.downloaded(from: url)
            self.productImageView.contentMode = .scaleAspectFit
        }else{
            self.productImageView.image = UIImage(named: "fyndLogo")
        }
        
        if let name = productName{
            self.productNameLabel.text = name
            
        }else{
            self.productNameLabel.text = ""
        }
        
        
        let doubleTapGest = UITapGestureRecognizer(target: self, action: #selector(doubleTapToZoom(recognizer:)))
        doubleTapGest.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTapGest)
    }
    
    @objc func doubleTapToZoom(recognizer: UITapGestureRecognizer) {
        if scrollView.zoomScale == 1 {
            scrollView.zoom(to: zoomRectForScale(scale: scrollView.maximumZoomScale, center: recognizer.location(in: recognizer.view)), animated: true)
//            scrollView.zoom(to: scrollView!.maximumZoomScale, animated: true)
//            scrollView.setZoomScale(5.0, animated: true)
        } else {
            scrollView.setZoomScale(1, animated: true)
        }
    }
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint) -> CGRect {
        var zoomRect = CGRect.zero
        zoomRect.size.height = productImageView.frame.size.height / scale
        zoomRect.size.width  = productImageView.frame.size.width  / scale
        let newCenter = productImageView.convert(center, from: scrollView)
        zoomRect.origin.x = newCenter.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = newCenter.y - (zoomRect.size.height / 2.0)
        return zoomRect
    }
    
    
    func saveCropedImage(){
        UIGraphicsBeginImageContextWithOptions(scrollView.bounds.size, true, UIScreen.main.scale)
        let offset = scrollView.contentOffset
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.translateBy(x: -offset.x, y: -offset.y)
        scrollView.backgroundColor = UIColor.white
        scrollView.layer.render(in: context)
        
        let cropFinalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.productImageView.image = cropFinalImage
        
        /*
        self.dismiss(animated: true) {
            self.cropImageDelegate?.setCropImageInCollectionVew(indexPath: self.indexPath, section: self.section, image: cropFinalImage)
        }*/
        
        
    }
}

//MARK:- scrollviewdelegate
extension ShowImageViewController : UIScrollViewDelegate{
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return productImageView
    }
    
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentFrame = productImageView.frame
        
        if contentFrame.size.width < boundsSize.width{
            contentFrame.origin.x = (boundsSize.width - contentFrame.size.width) / 2
        }
        else{
            contentFrame.origin.x = 0
        }
        
        if contentFrame.size.height < boundsSize.height{
            contentFrame.origin.y = (boundsSize.height - contentFrame.size.height) / 2
        }
        else{
            contentFrame.origin.y = 0
        }
        productImageView.frame = contentFrame
    }
}
