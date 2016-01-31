//
//  GameScene.swift
//  Bitcoin Benefactor
//
//  Created by Brad Guesman on 1/30/16.
//  Copyright (c) 2016 Brad Guesman. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    let player: SKSpriteNode = SKSpriteNode(imageNamed: "phil1.png")
    
    let tallGoldPile: SKSpriteNode = SKSpriteNode(imageNamed: "GoldPile.png")
    let longGoldPile: SKSpriteNode = SKSpriteNode(imageNamed: "GoldPile2.png")
    let smallLongGoldPile: SKSpriteNode = SKSpriteNode(imageNamed: "GoldPile3.png")
    let smallTallGoldPile: SKSpriteNode = SKSpriteNode(imageNamed: "GoldPile4.png")
    
    let plane: SKSpriteNode = SKSpriteNode(imageNamed: "Plane.png")
    
    let buildingOne: SKSpriteNode = SKSpriteNode(imageNamed: "tower.png")
    let buildingTwo: SKSpriteNode = SKSpriteNode(imageNamed: "building.png")
    let buildingThree: SKSpriteNode = SKSpriteNode(imageNamed: "skyscraper.png")
    
    let skylineOne: SKSpriteNode = SKSpriteNode(imageNamed: "skyline.png")
    let skylineTwo: SKSpriteNode = SKSpriteNode(imageNamed: "skyline.png")
    
    let forestCenter: SKSpriteNode = SKSpriteNode(imageNamed: "Forest.png")
    let forestRight: SKSpriteNode = SKSpriteNode(imageNamed: "Forest.png")
    let forestLeft: SKSpriteNode = SKSpriteNode(imageNamed: "Forest.png")
    
    
    let car: SKSpriteNode = SKSpriteNode(imageNamed: "car.png")
    
    let bird: SKSpriteNode = SKSpriteNode(imageNamed: "bird.png")
    let panda: SKSpriteNode = SKSpriteNode(imageNamed: "panda.png")
    
    let charityOne: SKSpriteNode = SKSpriteNode(imageNamed: "Cabin1.png")
    let charityTwo: SKSpriteNode = SKSpriteNode(imageNamed: "Cabin2.png")
    let charityThree: SKSpriteNode = SKSpriteNode(imageNamed: "Cabin3.png")
    
    var moneyInAccount: Int = 1000000000
    var heartCount: Int = 0
    var scoreMultiplier: Int = 1
    var scoreLabel: UILabel!
    var heartLabel: UILabel!
    var isHeart: Int!
    var heartProbability: Int = 0
    let heartProbabilityMultiplier: Double = 2
    var charityLevel: Int = 0
    
    var scoreMultiplierCost: Int!
    var nextScoreMultiplierCost: Int = 10
    var heartProbabilityCost: Int!
    var nextHeartProbabilityCost: Int = 10
    var charityUpgradeCost: Int!
    var nextCharityUpgradeCost: Int = 20
    
    override func didMoveToView(view: SKView) {
        
        /* Setup your scene here */
        let background = SKSpriteNode(imageNamed: "background.png")
        
        background.xScale = frame.size.width/background.size.width
        background.yScale = frame.size.height/background.size.height
        
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        self.addChild(background)
        
        scoreLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        scoreLabel.font = UIFont(name: "Press Start 2P", size: 12)
        scoreLabel.center = CGPoint(x: 100 + 15, y: 20)
        scoreLabel.textAlignment = NSTextAlignment.Left
        scoreLabel.text = "$" + String(moneyInAccount)
        scoreLabel.textColor = UIColor.blackColor()
        self.view?.addSubview(scoreLabel)
        
        heartLabel = UILabel(frame: CGRectMake(0, 0, 200, 21))
        heartLabel.font = UIFont(name: "Press Start 2P", size: 12)
        heartLabel.center = CGPoint(x: size.width/2 + 10, y: 20)
        heartLabel.textAlignment = NSTextAlignment.Center
        heartLabel.text = "Hearts:" + String(heartCount)
        heartLabel.textColor = UIColor.blackColor()
        self.view?.addSubview(heartLabel)
        
        let timer: NSTimer = NSTimer.scheduledTimerWithTimeInterval(
            10, target: self, selector: "donateToCharity",
            userInfo: nil, repeats: true)
        
        initializeStaticSprites()
        
        addChild(player)
        addChild(longGoldPile)
        addChild(tallGoldPile)
        addChild(plane)
        addChild(buildingOne)
        addChild(buildingTwo)
        addChild(buildingThree)
        addChild(skylineOne)
        addChild(skylineTwo)
        addChild(car)
        addChild(smallLongGoldPile)
        addChild(smallTallGoldPile)
        addChild(bird)
        addChild(panda)
        addChild(forestCenter)
        addChild(forestRight)
        addChild(forestLeft)
        addChild(charityOne)
        addChild(charityTwo)
        addChild(charityThree)
    }
    
    func donateToCharity() {
        switch (charityLevel) {
        case 1: moneyInAccount -= 100
        case 2: moneyInAccount -= 10000
        case 3: moneyInAccount -= 1000000
        case 4: moneyInAccount -= 10000000
        default: moneyInAccount -= 0
        }
        scoreLabel.text = "$" + String(moneyInAccount)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        runAction(SKAction.playSoundFileNamed("Super Mario Bros.-Coin Sound Effect.mp3",
            waitForCompletion: false))
        
        for _ in touches {
            
            let initialForce = CGVector(dx: 1000 * drand48() * cos(drand48() * 3.14),
                dy: 1100 * drand48())
            
            let isHeart = drand48();
            if (isHeart > 0.01 && isHeart < (0.01 * heartProbabilityMultiplier)) {
                let heartSprite = HeartNode.heart(CGPoint(x: size.width * 0.5, y: size.height * 0.5))
                heartSprite.zPosition = 1;
                let applyInitialForce = SKAction.applyForce(initialForce, duration: 0.1)
                heartSprite.runAction(applyInitialForce)
                
                self.addChild(heartSprite)
                
                addHeart()
            }
                
            else {
                
                let coinSprite = CoinNode.coin(CGPoint(x: size.width * 0.5, y: size.height * 0.5))
                coinSprite.zPosition = 1;
                let applyInitialForce = SKAction.applyForce(initialForce, duration: 0.1)
                coinSprite.runAction(applyInitialForce)
                
                self.addChild(coinSprite)
                
            }
            donateMoney()
        }
    }
    
    func randNumber() -> Float {
        return Float(drand48())
    }
    
    func donateMoney() {
        moneyInAccount -= scoreMultiplier
        scoreLabel.text = "$" + String(moneyInAccount)
        reapTheBenefitsOfSocialService()
    }
    
    func addHeart() {
        heartCount++
        heartLabel.text = "Hearts:" + String(heartCount)
    }
    
    func decreaseHearts(amount : Int) {
        heartCount = heartCount - amount
        heartLabel.text = "Hearts:" + String(heartCount)
        
    }
    
    func checkPurchase(cost : Int) -> Bool {
        if (cost > heartCount) {
            return false
        }
        else {
            return true
        }
    }
    
    func increaseScoreMultiplier() {
        switch (scoreMultiplier) {
            case 1: scoreMultiplierCost = 10
                nextScoreMultiplierCost = 50
            case 10: scoreMultiplierCost = 50
                nextScoreMultiplierCost = 100
            case 100: scoreMultiplierCost = 100
                nextScoreMultiplierCost = 500
            case 1000: scoreMultiplierCost = 500
                nextScoreMultiplierCost = 0
        default: scoreMultiplierCost = 0
        }
        if checkPurchase(scoreMultiplierCost) && scoreMultiplier <= 100000{
            scoreMultiplier = scoreMultiplier * 10
            decreaseHearts(scoreMultiplierCost)
        }
        else {
            return
        }
    }
    
    func increaseHeartProbability() {
        switch (heartProbability) {
        case 0: heartProbabilityCost = 10
            nextHeartProbabilityCost = 50
        case 1: heartProbabilityCost = 50
            nextHeartProbabilityCost = 100
        case 2: heartProbabilityCost = 100
            nextHeartProbabilityCost = 200
        case 3: heartProbabilityCost = 200
            nextHeartProbabilityCost = 0
        default: heartProbabilityCost = 0
        }
        if checkPurchase(heartProbabilityCost) && heartProbability < 4 {
            heartProbability++
            switch (heartProbability) {
            case 0: let heartProbabilityMultiplier = 3
            case 1: let heartProbabilityMultiplier = 6
            case 2: let heartProbabilityMultiplier = 9
            case 3: let heartProbabilityMultiplier = 10
            default: let heartProbabilityMultiplier = 10
            }
            decreaseHearts(heartProbabilityCost)
            //NSLog("Heart prob increased")
        }
        else {
            return
        }
    }
    
    func upgradeCharity() {
        switch (charityLevel) {
        case 0: charityUpgradeCost = 20
            nextCharityUpgradeCost = 200
        case 1: charityUpgradeCost = 200
            nextCharityUpgradeCost = 500
        case 2: charityUpgradeCost = 500
            nextCharityUpgradeCost = 1000
        case 3: charityUpgradeCost = 1000
            nextCharityUpgradeCost = 0
        default: charityUpgradeCost = 0
        }
        if (checkPurchase(charityUpgradeCost) && charityLevel < 4) {
            charityLevel++
                switch (charityLevel) {
                case 1: charityOne.hidden = false
                case 2: charityTwo.hidden = false
                case 3: charityThree.hidden = false
                default: charityUpgradeCost = 0
            }
            decreaseHearts(charityUpgradeCost)
        }
        else {
            return
        }
    }
    
    func initializeStaticSprites() {
        tallGoldPile.xScale = 0.17
        tallGoldPile.yScale = 0.17
        tallGoldPile.position = CGPoint(x:size.width * 0.28, y: size.height * 0.38)
        tallGoldPile.zPosition = 0.4
        
        longGoldPile.xScale = 0.19
        longGoldPile.yScale = 0.19
        longGoldPile.position = CGPoint(x:size.width * 0.71, y: size.height * 0.39)
        longGoldPile.zPosition = 0.4
        
        plane.xScale = 0.7
        plane.yScale = 0.7
        plane.position = CGPoint(x:size.width * 0.20, y: size.height * 0.76)
        plane.zPosition = 0.4
        
        bird.xScale = 0.17
        bird.yScale = 0.17
        bird.position = CGPoint(x:size.width * 0.20, y: size.height * 0.76)
        bird.zPosition = 0.4
        bird.hidden = true
        
        smallLongGoldPile.xScale = 0.19
        smallLongGoldPile.yScale = 0.19
        smallLongGoldPile.position = CGPoint(x:size.width * 0.63, y: size.height * 0.39)
        smallLongGoldPile.zPosition = 0.4
        smallLongGoldPile.hidden = true
        
        smallTallGoldPile.xScale = 0.17
        smallTallGoldPile.yScale = 0.17
        smallTallGoldPile.position = CGPoint(x:size.width * 0.33, y: size.height * 0.38)
        smallTallGoldPile.zPosition = 0.4
        smallTallGoldPile.hidden = true
        
        buildingOne.xScale = 0.4
        buildingOne.yScale = 0.4
        buildingOne.position = CGPoint(x:size.width * 0.33, y: size.height * 0.57)
        buildingOne.zPosition = 0.2
        
        buildingTwo.xScale = 0.5
        buildingTwo.yScale = 0.5
        buildingTwo.position = CGPoint(x:size.width * 0.78, y: size.height * 0.56)
        buildingTwo.zPosition = 0.2
        
        
        buildingThree.xScale = 0.73
        buildingThree.yScale = 0.8
        buildingThree.position = CGPoint(x:size.width * 0.53, y: size.height * 0.59)
        buildingThree.zPosition = 0.2
        
        skylineOne.xScale = 0.2
        skylineOne.yScale = 0.2
        skylineOne.position = CGPoint(x:size.width * 0.25, y: size.height * 0.45)
        skylineOne.zPosition = 0.1
        
        skylineTwo.xScale = 0.2
        skylineTwo.yScale = 0.2
        skylineTwo.position = CGPoint(x:size.width * 0.75, y: size.height * 0.45)
        skylineTwo.zPosition = 0.1
        
        forestCenter.xScale = 1.7
        forestCenter.yScale = 1.1
        forestCenter.position = CGPoint(x:size.width * 0.5, y: size.height * 0.42)
        forestCenter.zPosition = 0.26
        forestCenter.hidden = true
        
        forestRight.xScale = 1.7
        forestRight.yScale = 1.1
        forestRight.position = CGPoint(x:size.width * 0.75, y: size.height * 0.42)
        forestRight.zPosition = 0.26
        forestRight.hidden = true
        
        forestLeft.xScale = 1.7
        forestLeft.yScale = 1.1
        forestLeft.position = CGPoint(x:size.width * 0.25, y: size.height * 0.42)
        forestLeft.zPosition = 0.26
        forestLeft.hidden = true
        
        car.xScale = 0.37
        car.yScale = 0.37
        car.position = CGPoint(x:size.width * 0.88, y: size.height * 0.37)
        car.zPosition = 0.3
        
        panda.xScale = 0.37
        panda.yScale = 0.37
        panda.position = CGPoint(x:size.width * 0.88, y: size.height * 0.39)
        panda.zPosition = 0.3
        panda.hidden = true
        
        charityOne.xScale = 1.4
        charityOne.yScale = 1.5
        charityOne.position = CGPoint(x:size.width * 0.21, y: size.height * 0.47)
        charityOne.zPosition = 0.25
        charityOne.hidden = true
        
        charityTwo.xScale = 1.4
        charityTwo.yScale = 1.5
        charityTwo.position = CGPoint(x:size.width * 0.80, y: size.height * 0.49)
        charityTwo.zPosition = 0.25
        charityTwo.hidden = true
        
        charityThree.xScale = 1.4
        charityThree.yScale = 1.5
        charityThree.position = CGPoint(x:size.width * 0.49, y: size.height * 0.5)
        charityThree.zPosition = 0.25
        charityThree.hidden = true
        
        player.xScale = 0.25
        player.yScale = 0.25
        player.position = CGPoint(x: size.width * 0.5, y: size.height * 0.4)
        player.zPosition = 0.5
    }
    
    func reapTheBenefitsOfSocialService() {
        if (moneyInAccount < 100000000) {
            panda.hidden = false
        }
        if (moneyInAccount < 200000000) {
            car.hidden = true
        }
        if (moneyInAccount < 450000000) {
            bird.hidden = false
        }
        if (moneyInAccount < 500000000) {
            plane.hidden = true
        }
        if (moneyInAccount < 575000000) {
            forestRight.hidden = false
            forestLeft.hidden = false
        }
        if (moneyInAccount < 650000000) {
            forestCenter.hidden = false
            smallLongGoldPile.hidden = true
            smallTallGoldPile.hidden = true
        }
        if (moneyInAccount < 700000000) {
            skylineOne.hidden = true
            skylineTwo.hidden = true
        }
        if (700000000 < moneyInAccount && moneyInAccount < 900000000) {
            buildingOne.hidden = true
            tallGoldPile.hidden = true
            longGoldPile.hidden = true
            smallLongGoldPile.hidden = false
            smallTallGoldPile.hidden = false
        }
        if (moneyInAccount < 999900000) {
            buildingTwo.hidden = true
        }
        if (moneyInAccount < 999999000) {
            buildingThree.hidden = true
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}