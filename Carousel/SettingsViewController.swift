//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Mudit Mittal on 2/15/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func closeButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignout(sender: AnyObject) {
        let alertController = UIAlertController(title: "", message: "Are you sure you want to sign out?", preferredStyle: .ActionSheet)
        // create a cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle cancel response here. Doing nothing will dismiss the view.
        }
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "Sign Out", style: .Default) { (action) in
            // handle response here.
            self.performSegueWithIdentifier("signoutSegue", sender: nil)
            
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        presentViewController(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
        }
    }

}
