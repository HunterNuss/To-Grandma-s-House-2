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
       static let cookie: UInt32 = 0b1
}

class GameScene: SKScene {
    
    var littleRed = SKSpriteNode()
    var cookie = SKSpriteNode()
    
    var isFingerOnRed = true
    let screenSize = UIScreen.main.bounds
    
    var seconds = 30
    var timer = Timer()
    
    override func sceneDidLoad() {
        littleRed = childNode(withName: "littleRed") as! SKSpriteNode
        littleRed.physicsBody?.categoryBitMask = PhysicsCategory.littleRed
        
        cookie.physicsBody?.categoryBitMask = PhysicsCategory.cookie
        
        cookieTimer()
    }
    
    
    
    
    
    func touchRed() {
        isFingerOnRed = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchRed()
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
        var randx = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
        
        cookie = SKSpriteNode(imageNamed: "Cookie")
        cookie.size = CGSize(width: 30, height: 30)
        cookie.position = CGPoint(x: randx, y: 400)
        
        cookie.physicsBody = SKPhysicsBody(rectangleOf: cookie.frame.size)
        cookie.physicsBody?.affectedByGravity = true
        cookie.physicsBody?.allowsRotation = false
        cookie.physicsBody?.friction = 0
        cookie.physicsBody?.restitution = 1
        cookie.physicsBody?.isDynamic = true
        
        cookie.name = "cookie"
        addChild(cookie)
        
    }
    
    
    
    
    
    @objc func fallingCookies() {
        var randx = CGFloat(arc4random_uniform(UInt32(screenSize.width)))

        if cookie.position.y == -80 {
            createCookies()
        } else {
            createCookies()
        }
    
        
        
        if seconds == 0 {
            let gameScene = GameScene(fileNamed: "WinningScene")
            gameScene?.scaleMode = .aspectFill
            gameScene?.size = self.size
            let reveal = SKTransition.fade(with: UIColor.cyan, duration: 1)
            view?.presentScene(gameScene!, transition: reveal)
        } else {
            seconds -= 1
        }
    }
    




    func cookieTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(GameScene.fallingCookies)), userInfo: nil, repeats: true)
    }





//func createBall(position : SCNVector3){
//
//    var ballShape = SCNSphere(radius: 0.005)
//    var ballNode = SCNNode(geometry: ballShape)
//
//    ballNode.position = position
//    sceneView.scene.rootNode.addChildNode(ballNode)
//
//    ballNode.geometry = ballNode.geometry!.copy() as? SCNGeometry
//    ballNode.geometry?.firstMaterial = ballNode.geometry?.firstMaterial!.copy() as? SCNMaterial
//
//    ballNode.geometry?.firstMaterial?.diffuse.contents = UIColor.randomColor()
//}



//@objc func ballTimerCalled() {
//    var screenWidth = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
//    var screenHeight = CGFloat(arc4random_uniform(UInt32(screenSize.height)))
//
//    let point = CGPoint(x: screenWidth, y: screenHeight)
//    let result = sceneView.hitTest(point, types: [ARHitTestResult.ResultType.featurePoint])
//    guard let hitResult = result.last else {return}
//    let hitTransform = SCNMatrix4(hitResult.worldTransform)
//    let hitVector = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43)
//    createBall(position: hitVector)
//
//    if seconds == 0 {
//        performSegue(withIdentifier: "segue2", sender: self)
//        timer.invalidate()
//    }else{
//        seconds -= 1
//    }
//
//
//}



//func ballRunTimer() {
//    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.ballTimerCalled)), userInfo: nil, repeats: true)
//
//}



}
