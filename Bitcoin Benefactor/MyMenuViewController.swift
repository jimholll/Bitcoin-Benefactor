//
//  MyMenuViewController.swift
//  Bitcoin Benefactor
//
//  Created by Jim Hollingworth on 1/31/16.
//  Copyright © 2016 Brad Guesman. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation



class MyMenuViewController: UIViewController {
    
    var scene : GameScene!
    var coinLabel: UILabel!
    var heartLevelLabel: UILabel!
    var charityLevelLabel: UILabel!
    var coinCost: UILabel!
    var heartCost: UILabel!
    var charityCost: UILabel!


    



    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinLabel = UILabel(frame: CGRectMake(178, 37, 200, 21))
        coinLabel.font = UIFont(name: "Press Start 2P", size: 23)
        coinLabel.center = CGPoint(x: view.frame.size.width - 60, y: 135)
        coinLabel.textAlignment = NSTextAlignment.Left
        coinLabel.text = "$" + String(0)
        coinLabel.textColor = UIColor.whiteColor()
        self.view?.addSubview(coinLabel)
        coinLabel.text = "x" + String(scene.scoreMultiplier)
        
        heartLevelLabel = UILabel(frame: CGRectMake(178, 37, 200, 21))
        heartLevelLabel.font = UIFont(name: "Press Start 2P", size: 23)
        heartLevelLabel.center = CGPoint(x: view.frame.size.width - 60, y: 290)
        heartLevelLabel.textAlignment = NSTextAlignment.Left
        heartLevelLabel.text = "$" + String(0)
        heartLevelLabel.textColor = UIColor.whiteColor()
        self.view?.addSubview(heartLevelLabel)
        heartLevelLabel.text = "x" + String(scene.heartProbability + 1)
        
        charityLevelLabel = UILabel(frame: CGRectMake(178, 37, 200, 21))
        charityLevelLabel.font = UIFont(name: "Press Start 2P", size: 23)
        charityLevelLabel.center = CGPoint(x: view.frame.size.width - 60, y: 500)
        charityLevelLabel.textAlignment = NSTextAlignment.Left
        charityLevelLabel.text = "$" + String(0)
        charityLevelLabel.textColor = UIColor.whiteColor()
        self.view?.addSubview(charityLevelLabel)
        charityLevelLabel.text = "x" + String(scene.charityLevel + 1)
        
        coinCost = UILabel(frame: CGRectMake(178, 37, 200, 21))
        coinCost.font = UIFont(name: "Press Start 2P", size: 12)
        coinCost.center = CGPoint(x: view.frame.size.width/2, y: 180)
        coinCost.textAlignment = NSTextAlignment.Center
        coinCost.text = "$" + String(0)
        coinCost.textColor = UIColor.whiteColor()
        self.view?.addSubview(coinCost)
        if (scene.nextScoreMultiplierCost == 0) {
            coinCost.text = "MAXIMUM POWER"
        }
        else {
            coinCost.text = "Cost: " + String(scene.nextScoreMultiplierCost) + " Hearts"
        }
        
        heartCost = UILabel(frame: CGRectMake(178, 37, 200, 21))
        heartCost.font = UIFont(name: "Press Start 2P", size: 12)
        heartCost.center = CGPoint(x: view.frame.size.width/2, y: 345)
        heartCost.textAlignment = NSTextAlignment.Center
        heartCost.text = "$" + String(0)
        heartCost.textColor = UIColor.whiteColor()
        self.view?.addSubview(heartCost)
        if (scene.nextHeartProbabilityCost == 0) {
            heartCost.text = "MAXIMUM POWER"
        }
        else {
            heartCost.text = "Cost: " + String(scene.nextHeartProbabilityCost) + " Hearts"
        }
        
        charityCost = UILabel(frame: CGRectMake(178, 37, 300, 21))
        charityCost.font = UIFont(name: "Press Start 2P", size: 12)
        charityCost.center = CGPoint(x: view.frame.size.width/2, y: 545)
        charityCost.textAlignment = NSTextAlignment.Center
        charityCost.text = "$" + String(0)
        charityCost.textColor = UIColor.whiteColor()
        self.view?.addSubview(charityCost)
        if (scene.nextCharityUpgradeCost == 0) {
            charityCost.text = "MAXIMUM POWER"
        }
        else {
            charityCost.text = "Cost: " + String(scene.nextCharityUpgradeCost) + " Hearts"
        }

        // Do any additional setup after loading the view.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTheScene(scene : GameScene) {
        self.scene = scene
    }
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var buttonheart: UIButton!
    
    @IBAction func jButtonPressed(sender: AnyObject) {
        //score multiplier
        scene.increaseScoreMultiplier()
        coinLabel.text = "x" + String(scene.scoreMultiplier)
        if (scene.nextScoreMultiplierCost == 0) {
            coinCost.text = "MAXIMUM POWER"
        }
        else {
            coinCost.text = "Cost: " + String(scene.nextScoreMultiplierCost) + " Hearts"
        }
    }

    @IBAction func heartButtonPressed(sender: AnyObject) {
        //heart probability
        scene.increaseHeartProbability()
        heartLevelLabel.text = "x" + String(scene.heartProbability + 1)
        if (scene.nextHeartProbabilityCost == 0) {
            heartCost.text = "MAXIMUM POWER"
        }
        else {
            heartCost.text = "Cost: " + String(scene.nextHeartProbabilityCost) + " Hearts"
        }
    }
    
    @IBAction func hButtonPressed(sender: AnyObject) {
        //upgrading charity
        scene.upgradeCharity()
        charityLevelLabel.text = "x" + String(scene.charityLevel + 1)
        if (scene.nextCharityUpgradeCost == 0) {
            charityCost.text = "MAXIMUM POWER"
        }
        else {
            charityCost.text = "Cost: " + String(scene.nextCharityUpgradeCost) + " Hearts"
        }
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
