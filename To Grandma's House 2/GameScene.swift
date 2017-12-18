//
//  GameScene.swift
//  To Grandma's House 2
//
//  Created by  on 12/14/17.
//  Copyright © 2017 Hunter. All rights reserved.
//

import SpriteKit
import GameplayKit
struct PhysicsCategory {
       static let littlered: UInt32 = 0
}

class GameScene: SKScene {
    var littleRed = SKSpriteNode()
    override func didMove(to view: SKView) {
         littleRed = childNode(withName: "littleRed") as! SKSpriteNode
         littleRed.physicsBody?.categoryBitMask = PhysicsCategory.littlered
    }
    var isFingerOnRed = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        if let body = physicsWorld.body(at: touchLocation) {
            if body.node?.name == "littleRed" {
                print("I got Red")
                isFingerOnRed = true
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isFingerOnRed == true {
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            littleRed.position = CGPoint(x: touchLocation.x, y: littleRed.position.y)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnRed = false
    }
}
