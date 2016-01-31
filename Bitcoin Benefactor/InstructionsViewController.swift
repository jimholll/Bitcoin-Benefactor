//
//  Instructions.swift
//  Bitcoin Benefactor
//
//  Created by Jim Hollingworth on 1/31/16.
//  Copyright © 2016 Brad Guesman. All rights reserved.
//

import UIKit
import SpriteKit

class InstructionsViewController: UIViewController {
    
    
    var isMagenta: Bool = true
    
    @IBOutlet weak var titleTop: UILabel!
    @IBOutlet weak var titleBottom: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}