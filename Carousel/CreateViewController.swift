//
//  CreateViewController.swift
//  Carousel
//
//  Created by Mudit Mittal on 2/15/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    var initialY: CGFloat!
    var offset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createNav: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var createIndicator: UIActivityIndicatorView!

    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func createButton(sender: AnyObject) {
        if firstnameField.text!.isEmpty || lastnameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty || !(checkBoxButton.selected){
            let alertController = UIAlertController(title: "Form Incomplete", message: "Please fill all details to create your Dropbox.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OKAction)
                presentViewController(alertController, animated: true) {
            }
        } else {
            self.createIndicator.startAnimating()
            delay(2, closure: { () -> () in
                self.createIndicator.stopAnimating()
                self.performSegueWithIdentifier("createSegue", sender: nil)
            })
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)    
    }
    
    @IBAction func onCheckbox(sender: AnyObject) {
        checkBoxButton.selected = !checkBoxButton.selected
    }

    @IBAction func onTerms(sender: AnyObject) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        initialY = fieldParentView.frame.origin.y
        offset = -50
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -110
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.7, 0.7)
        createNav.transform = transform
        fieldParentView.transform = transform
        createNav.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.createNav.transform = CGAffineTransformIdentity
            self.fieldParentView.alpha = 1
            self.createNav.alpha = 1
            self.createIndicator.stopAnimating()

        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY + offset
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        fieldParentView.frame.origin.y = initialY
        buttonParentView.frame.origin.y = buttonInitialY
        scrollView.contentOffset.y = 0
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
