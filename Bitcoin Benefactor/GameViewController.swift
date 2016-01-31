//
//  GameViewController.swift
//  Bitcoin Benefactor
//
//  Created by Brad Guesman on 1/30/16.
//  Copyright (c) 2016 Brad Guesman. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var centerNavigationController: UINavigationController!
    var scene: GameScene!
    @IBOutlet weak var winButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        winButton.hidden = true
        skView.presentScene(scene)
        NSLog("prepareForSegue activated score is: %d", scene.moneyInAccount)
        
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(
            1, target: self, selector: "checkIfWon",
            userInfo: nil, repeats: true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "MenuSegue") {
            NSLog("scoree is: %d", scene.moneyInAccount)
            let destview = segue.destinationViewController as! MyMenuViewController
            destview.setTheScene(scene)
            
        }
    }
    
    func checkIfWon() {
        if scene.moneyInAccount <= 0 {
            winButton.hidden = false
        }
        
    }
    
    @IBAction func prepareForUnwindFromMenu(segue: UIStoryboardSegue) {
        
    }
    
}