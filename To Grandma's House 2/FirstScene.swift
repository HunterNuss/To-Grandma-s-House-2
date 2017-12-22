//
//  FirstScene.swift
//  To Grandma's House 2
//
//  Created by Noah McMahon on 12/15/17.
//  Copyright © 2017 Hunter. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class FirstScene: SKScene {

let start = SKLabelNode(fontNamed: "Arial")
    
    override func didMove(to view: SKView) {
        start.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        start.numberOfLines = 2
        start.text = "Game Over\nClick Anywhere To Play Again"
        start.fontSize = 40
        start.fontColor = UIColor.white
        addChild(start)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(fileNamed: "GameScene")
        gameScene?.scaleMode = .aspectFill
        gameScene?.size = self.size
        let reveal = SKTransition.doorsCloseHorizontal(withDuration: 1)
        view?.presentScene(gameScene!, transition: reveal)
        
        
    }
    
}
