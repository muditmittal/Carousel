//
//  IntroViewController.swift
//  Carousel
//
//  Created by Mudit Mittal on 2/14/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!

    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func transformView(view : UIView!, atIndex index : Int, offset : Float) {
        
    }
    
    func updateViewTransformWithOffset(offset : Float) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
            scrollView.delegate = self
            scrollView.contentSize = imageView.image!.size
            scrollView.sendSubviewToBack(imageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -70, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile1.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile1.transform = CGAffineTransformScale(tile1.transform, CGFloat(scale), CGFloat(scale))
        tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 75, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile2.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile2.transform = CGAffineTransformScale(tile2.transform, CGFloat(scale), CGFloat(scale))
        tile2.transform = CGAffineTransformRotate(tile2.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 30, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile3.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile3.transform = CGAffineTransformScale(tile3.transform, CGFloat(scale), CGFloat(scale))
        tile3.transform = CGAffineTransformRotate(tile3.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 100, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile4.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile4.transform = CGAffineTransformScale(tile4.transform, CGFloat(scale), CGFloat(scale))
        tile4.transform = CGAffineTransformRotate(tile4.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -100, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        tile5.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile5.transform = CGAffineTransformScale(tile5.transform, CGFloat(scale), CGFloat(scale))
        tile5.transform = CGAffineTransformRotate(tile5.transform, CGFloat(Double(rotation) * M_PI / 180))
        
        tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -75, r2Max: 0)
        ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        tile6.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        tile6.transform = CGAffineTransformScale(tile6.transform, CGFloat(scale), CGFloat(scale))
        tile6.transform = CGAffineTransformRotate(tile6.transform, CGFloat(Double(rotation) * M_PI / 180))
        

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

    }
    

}
