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

    override func viewDidLoad() {
        super.viewDidLoad()
            scrollView.delegate = self
            scrollView.contentSize = imageView.image!.size

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        //print(scrollView.contentOffset.x, scrollView.contentOffset.y)
        //print(UIScreen.mainScreen().bounds.height)
        //tile1.transform = CGAffineTransformMakeTranslation(-80, -300)
        //tile1.transform = CGAffineTransformScale(tile1.transform, 1, 1)
        //tile1.transform = CGAffineTransformRotate(tile1.transform, CGFloat(-18 * M_PI / 180))

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

    }
    

}
