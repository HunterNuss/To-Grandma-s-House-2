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
       static let physicsLittleRed: UInt32 = 1
       static let physicsCookie: UInt32 = 0b10
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var littleRed = SKSpriteNode()
    var cookie = SKSpriteNode()
    
    var isFingerOnRed = true

    var seconds = 15
    var timer = Timer()
    
    override func sceneDidLoad() {
        littleRed = childNode(withName: "littleRed") as! SKSpriteNode
        littleRed.physicsBody?.categoryBitMask = PhysicsCategory.physicsLittleRed
        cookie.physicsBody?.categoryBitMask = PhysicsCategory.physicsCookie

        cookieTimer()
        
        cookie.physicsBody?.isDynamic = true
        littleRed.physicsBody?.contactTestBitMask = PhysicsCategory.physicsCookie
        physicsWorld.contactDelegate = self
    }
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == PhysicsCategory.physicsLittleRed && contact.bodyB.categoryBitMask == PhysicsCategory.physicsCookie) || (contact.bodyB.categoryBitMask == PhysicsCategory.physicsLittleRed && contact.bodyA.categoryBitMask == PhysicsCategory.physicsCookie) {
            
            let gameOverScene = LosingScene(size: self.size)
            let reveal = SKTransition.crossFade(withDuration: 1)
            view?.presentScene(gameOverScene, transition: reveal)
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnRed = true
        self.isUserInteractionEnabled = true
        let touch = touches.first
        let touchLocation = touch!.location(in: self)
        if let body = physicsWorld.body(at: touchLocation) {
            if body.node?.name == "littleRed" {
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
    
    
    
    
    
    

    func createCookies() {
        let screenSize = UIScreen.main.bounds
        var randx = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
        
        cookie = SKSpriteNode(imageNamed: "Cookie")
        cookie.size = CGSize(width: 30, height: 30)
        cookie.position = CGPoint(x: randx, y: 400)
        cookie.name = "cookie"
        addChild(cookie)

        cookie.physicsBody = SKPhysicsBody(rectangleOf: cookie.frame.size)
        cookie.physicsBody?.affectedByGravity = true
        cookie.physicsBody?.allowsRotation = false
        cookie.physicsBody?.friction = 0
        cookie.physicsBody?.restitution = 1
        cookie.physicsBody?.isDynamic = true
        cookie.physicsBody?.categoryBitMask = PhysicsCategory.physicsCookie
    }


    @objc func cookieTimerCalled() {
        createCookies()

        if cookie.position.y == -80 {
            removeChildren(in: [cookie])
            createCookies()
        }

        
        if seconds == 0 {
            timer.invalidate()
            let gameOverScene = WinningScene(size: self.size)
            let reveal = SKTransition.crossFade(withDuration: 1)
            view?.presentScene(gameOverScene, transition: reveal)
        } else {
            seconds -= 1
        }

    }

    func cookieTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: (#selector(GameScene.cookieTimerCalled)), userInfo: nil, repeats: true)
    }

}

