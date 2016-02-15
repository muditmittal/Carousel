//
//  TermsViewController.swift
//  Carousel
//
//  Created by Mudit Mittal on 2/15/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var webView: UIWebView!
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Convert the url String to a NSURL object.
        let requestURL = NSURL(string:url)
        // Place the URL in a URL Request.
        let request = NSURLRequest(URL: requestURL!)
        // Load Request into WebView.
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
