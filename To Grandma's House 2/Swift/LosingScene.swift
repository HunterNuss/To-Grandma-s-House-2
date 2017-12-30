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

class LosingScene: SKScene {
    
    let start = SKLabelNode(fontNamed: "Arial")
    
    override func didMove(to view: SKView) {
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(fileNamed: "FirstScene")
        gameScene?.scaleMode = .aspectFill
        gameScene?.size = self.size
        let reveal = SKTransition.fade(with: UIColor.cyan, duration: 1)
        view?.presentScene(gameScene!, transition: reveal)
        
        
    }
    
}
