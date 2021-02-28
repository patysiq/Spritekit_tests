//
//  GameViewController.swift
//  GameSpriteTest
//
//  Created by PATRICIA S SIQUEIRA on 27/02/21.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let view: SKView = SKView(frame: self.view.frame)
        self.view = view
        
        let scene:GameScene = GameScene(size: view.frame.size)
        view.presentScene(scene)
        
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        //debug physics
        //view.showsPhysics = true
        
        
    }
 
}
