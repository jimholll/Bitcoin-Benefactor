//
//  LaunchViewController.swift
//  Bitcoin Benefactor
//
//  Created by Brad Guesman on 1/31/16.
//  Copyright © 2016 Brad Guesman. All rights reserved.
//

import UIKit
import SpriteKit

class LaunchViewController: UIViewController {
    
    
    var isMagenta: Bool = true
    
    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var titleBottom: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
        self.titleTop.textColor = UIColor.magentaColor()
        self.titleBottom.textColor = UIColor.magentaColor()
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(
            0.4, target: self, selector: "update",
            userInfo: nil, repeats: true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func update() {
        if (self.isMagenta) {
            self.titleTop.textColor = UIColor.blueColor()
            self.titleBottom.textColor = UIColor.blueColor()
            self.isMagenta = false
        }
        else {
            self.titleTop.textColor = UIColor.magentaColor()
            self.titleBottom.textColor = UIColor.magentaColor()
            self.isMagenta = true
        }
        
    }
    
}