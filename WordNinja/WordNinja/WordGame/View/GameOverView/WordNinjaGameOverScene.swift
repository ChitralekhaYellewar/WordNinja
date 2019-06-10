//
//  WordNinjaGameOverScene.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import SpriteKit

class WordNinjaGameOverScene: SKScene {
    
    init(size: CGSize, won:Bool) {
        super.init(size: size)
        setUpGameOver(size: size, won: won, correct: 0, wrong: 0)
    }
    
    init(size: CGSize, won: Bool, correct: Int, wrong: Int) {
        super.init(size: size)
        setUpGameOver(size: size, won: won, correct: correct, wrong: wrong)
    }
    
    //MARK: set up game over scene.
    func setUpGameOver(size: CGSize, won:Bool, correct: Int, wrong: Int) {
        
        backgroundColor = SKColor.white
        
        let message = (correct == 5) ? Constants.WON : Constants.LOSE
        
        let coorectCountlabel = SKLabelNode(fontNamed: "Chalkduster")
        coorectCountlabel.text = "Correct Words: \(correct)"
        coorectCountlabel.fontSize = 30
        coorectCountlabel.fontColor = SKColor.black
        coorectCountlabel.position = CGPoint(x: size.width/2, y: size.height - 250)
        
        addChild(coorectCountlabel)
        
        let wrongCountLabel = SKLabelNode(fontNamed: "Chalkduster")
        wrongCountLabel.text = "Wrong Words: \(wrong)"
        wrongCountLabel.fontSize = 30
        wrongCountLabel.fontColor = SKColor.black
        wrongCountLabel.position = CGPoint(x: size.width/2, y: size.height - 150)
        addChild(wrongCountLabel)
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.purple
        label.position = CGPoint(x: size.width/2, y: size.height/2 - 50)
        addChild(label)
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run() { [weak self] in
                guard let `self` = self else { return }
                let reveal = SKTransition.flipHorizontal(withDuration: 1.0)
                let scene = WordNinjaGameScene(size: size)
                self.view?.presentScene(scene, transition:reveal)
            }
            ]))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
