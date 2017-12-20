//
//  FirstScene.swift
//  To Grandma's House 2
//
//  Created by Noah McMahon on 12/15/17.
//  Copyright © 2017 Hunter. All rights reserved.
//

import UIKit
import SpriteKit

class FirstScene: SKScene {

    var nameLabel = SKLabelNode()
    
    override func didMove(to view: SKView) {
        welcomeLabel()
    }
    
    func welcomeLabel() {
        nameLabel = SKLabelNode(fontNamed: "Arial")
        nameLabel.text = "To Grandma's House"
        nameLabel.fontSize = 50
        nameLabel.fontColor = UIColor.red
        nameLabel.position = CGPoint(x: frame.width / 2, y: 50)
        addChild(nameLabel)
    }
    
    
}
