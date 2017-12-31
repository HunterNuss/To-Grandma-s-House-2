//
//  WinningScene.swift
//  To Grandma's House 2
//
//  Created by Hunter Nuss on 12/29/17.
//  Copyright © 2017 Hunter. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class WinningScene: SKScene {
    
    var winningLabel = SKLabelNode()
    var playAgainLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        createLabels()
    }
    
    func createLabels() {
        winningLabel = SKLabelNode(fontNamed: "Arial")
        winningLabel.text = "You Win"
        winningLabel.fontSize = 25
        winningLabel.position = CGPoint(x: frame.width * 0.5, y: frame.height * 0.7)
        winningLabel.fontColor = UIColor.white
        addChild(winningLabel)
        
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

