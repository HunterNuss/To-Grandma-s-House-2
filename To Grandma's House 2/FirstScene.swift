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

    var nameLabel = SKLabelNode()
    var button = UIButton()
    var backgroundImage = UIImageView()
    
    
    override func didMove(to view: SKView) {
        background()
        welcomeLabel()
        transitionButton()
    }
    
    func welcomeLabel() {
        nameLabel = SKLabelNode(fontNamed: "Arial")
        nameLabel.text = "To Grandma's House"
        nameLabel.fontSize = 50
        nameLabel.fontColor = UIColor.red
        nameLabel.position = CGPoint(x: frame.width / 2, y: 50)
        addChild(nameLabel)
    }
    
    func transitionButton() {
        button = UIButton()
        button.setTitle("Play", for: .normal)
        
        let start = GameScene(size: self.size)
       // let start = GameScene(fileNamed: "GameScene")
        let reveal = SKTransition.flipVertical(withDuration: 1)
        view?.presentScene(start, transition: reveal)
        
        //                scene.scaleMode = .aspectFill

    }
    
    
    func background() {
        backgroundImage.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        backgroundImage.image = #imageLiteral(resourceName: "Little Red Background")
        view?.addSubview(backgroundImage)
            
    }
    
}
