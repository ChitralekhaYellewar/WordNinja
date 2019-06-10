//
//  WordNinjaGameViewController.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import UIKit
import SpriteKit

class WordNinjaGameViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGameUI()
    }
    
    //MARK: set up nija UI with word ninja game scene.
    func setUpGameUI() {
        let scene = WordNinjaGameScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        
        scene.viewController = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
