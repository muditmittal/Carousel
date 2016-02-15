//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by Mudit Mittal on 2/14/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var parentSpinButton: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
            parentSpinButton.hidden = true
            scrollView.delegate = self
            scrollView.contentSize = CGSize(width:1280, height:568)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        pageControl.currentPage = page
        
        if page == 3 {
            pageControl.hidden = true
            parentSpinButton.hidden = false
        } else {
            pageControl.hidden = false
            parentSpinButton.hidden = true
        }
        
    }
    
    @IBAction func onButton(sender: AnyObject) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
