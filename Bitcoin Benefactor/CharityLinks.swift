//
//  CharityLinks.swift
//  Bitcoin Benefactor
//
//  Created by Bianca on 1/31/16.
//  Copyright © 2016 Brad Guesman. All rights reserved.
//

import UIKit
import SpriteKit

class CharityLinks: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    @IBOutlet weak var pawsButton: UIButton!
    
    @IBOutlet weak var unicefButton: UIButton!
    
    @IBOutlet weak var redcrossButton: UIButton!
    
    @IBOutlet weak var stcButton: UIButton!
    
    @IBOutlet weak var wwfButton: UIButton!
    
    @IBAction func pawsButtonPressed(sender: AnyObject) {
        if let url = NSURL(string: "https://www.paws.org/") {
                    UIApplication.sharedApplication().openURL(url)
                }
    }
    @IBAction func unicefButtonPressed(sender: AnyObject) {
        if let url = NSURL(string: "http://support.unicef.org/campaign/donate-now") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func redcrossButtonPressed(sender: AnyObject) {
        if let url = NSURL(string: "https://www.redcross.org/donate/donation") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func wwfButtonPressed(sender: AnyObject) {
        if let url = NSURL(string: "https://support.worldwildlife.org/site/SPageServer?pagename=donate_to_charity") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func stcButtonPressed(sender: AnyObject) {
        if let url = NSURL(string: "https://secure.savethechildren.org/site/c.8rKLIXMGIpI4E/b.8102415/k.1377/Please_Give_Monthly_to_Save_the_Children/apps/ka/sd/donor.asp") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
}
