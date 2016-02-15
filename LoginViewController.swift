//
//  LoginViewController.swift
//  Carousel
//
//  Created by Mudit Mittal on 2/14/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    var initialY: CGFloat!
    var offset: CGFloat!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self

        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100

        initialY = fieldParentView.frame.origin.y
        offset = -50
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func viewWillAppear(animated: Bool) {
        let transform = CGAffineTransformMakeScale(0.7, 0.7)
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        loginNavBar.alpha = 0.3
        fieldParentView.alpha = 0.3
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.loginNavBar.transform = CGAffineTransformIdentity
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
            self.loginIndicator.stopAnimating()
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
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func backButton(sender: AnyObject) {
        navigationController?.popToRootViewControllerAnimated(true)
    }

    @IBAction func signinButton(sender: AnyObject) {
        loginIndicator.startAnimating()
        if emailField.text == "e" && passwordField.text == "p" {
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.performSegueWithIdentifier("signinSegue", sender: nil)
            })
        } else if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            let alertController = UIAlertController(title: "Missing details", message: "Both email and password are required.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            }
            alertController.addAction(OKAction)
            presentViewController(alertController, animated: true) {
            }
            self.loginIndicator.stopAnimating()
        } else {
                delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                let alertController = UIAlertController(title: "Login Error", message: "Please enter your email and password details again.", preferredStyle: .Alert)
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                }
                alertController.addAction(OKAction)
                self.presentViewController(alertController, animated: true) {
                }
            })
        }
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y <= -50 {
            view.endEditing(true)
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
