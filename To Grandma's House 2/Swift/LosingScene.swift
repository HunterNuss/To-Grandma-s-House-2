//
//  LosingScene.swift
//  To Grandma's House 2
//
//  Created by Hunter Nuss on 12/29/17.
//  Copyright © 2017 Hunter. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class LosingScene: SKScene, SKPhysicsContactDelegate {
    
    var losingLabel = SKLabelNode()
    var playAgainLabel = SKLabelNode()

    override func didMove(to view: SKView) {
        createLabels()
    }
    
    func createLabels() {
        losingLabel = SKLabelNode(fontNamed: "Arial")
        losingLabel.text = "You Lose"
        losingLabel.fontSize = 25
        losingLabel.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.7)
        losingLabel.fontColor = UIColor.white
        addChild(losingLabel)
        
        playAgainLabel = SKLabelNode(fontNamed: "Arial")
        playAgainLabel.text = "Tap Anywhere To Play Again"
        playAgainLabel.fontSize = 25
        playAgainLabel.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.3)
        playAgainLabel.fontColor = UIColor.white
        addChild(playAgainLabel)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(fileNamed: "FirstScene")
        gameScene?.scaleMode = .aspectFill
        gameScene?.size = self.size
        let reveal = SKTransition.fade(with: UIColor.cyan, duration: 1)
        view?.presentScene(gameScene!, transition: reveal)
        
        
    }
    
}
