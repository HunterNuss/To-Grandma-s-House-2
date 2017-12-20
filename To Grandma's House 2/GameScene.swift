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
       static let littleRed: UInt32 = 0
}

class GameScene: SKScene {
    
    var littleRed = SKSpriteNode()
    var isFingerOnRed = false
    
    override func sceneDidLoad() {
        littleRed = childNode(withName: "littleRed") as! SKSpriteNode
        littleRed.physicsBody?.categoryBitMask = PhysicsCategory.littleRed
        print("Works")
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isUserInteractionEnabled = true
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        if let body = physicsWorld.body(at: touchLocation) {
            if body.node?.name == "littleRed" {
                print("Red")
                isFingerOnRed = true
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isFingerOnRed == true {
            print("Moved")
            let touch = touches.first
            let touchLocation = touch!.location(in: self)
            littleRed.position = CGPoint(x: touchLocation.x, y: littleRed.position.y)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnRed = false
    }
}

