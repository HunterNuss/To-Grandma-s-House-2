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

    override func didMove(to view: SKView) {
        
    }
    
    func welcomeLabel() {
        let nameLabel = SKLabelNode(text: "To Grandma's House")
        nameLabel.fontSize = 25
        nameLabel.position = CGPoint(x: frame.width / 2, y: 50)
    }
    
    
}
