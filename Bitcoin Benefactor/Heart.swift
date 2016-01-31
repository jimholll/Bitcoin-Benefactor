//
//  Heart.swift
//  Bitcoin Benefactor
//
//  Created by Brad Guesman on 1/30/16.
//  Copyright © 2016 Brad Guesman. All rights reserved.
//

import UIKit
import SpriteKit

let HeartTexture = SKTexture(imageNamed: "heart.png")

class HeartNode: SKSpriteNode {
    class func heart(location: CGPoint) -> HeartNode {
//        let sprite = HeartNode(imageNamed:"coin.png")
        let sprite = HeartNode(texture: HeartTexture, size: CGSize(width: 640, height: 640))
        
        sprite.xScale = 0.075
        sprite.yScale = 0.075
        sprite.position = location
        
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: 640 * 0.075/2)
        
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.dynamic = true;
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        
        return sprite
    }
}
