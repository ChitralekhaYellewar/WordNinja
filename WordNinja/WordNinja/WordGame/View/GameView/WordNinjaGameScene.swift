//
//  WordNinjaGameScene.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import SpriteKit

class WordNinjaGameScene: SKScene {
    
    let wordToFindLabel = SKLabelNode(fontNamed: "Chalkduster")
    var possibleMatchWordLabel = SKLabelNode()
    var wordToFind = ""
    var matchingWord = ""
    var possibleMatchingWords = [Word]()
    var wordToFindIndex = 0
    var possibleMatchingWordIndex = 0
    var gameLevelCount = 5
    
    var correctWordsCount = 0
    var wrongWordsCount = 0
    
    var viewController: UIViewController?
    
    var wordsViewModel: WordsViewModel?
    
    
    override func didMove(to view: SKView) {
        getPreviousGameData()
        wordToFindIndex += 1
        setUpGame()
    }
    
    //MARK: handles touch action on possible words to be matched.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let touchNode = atPoint(location) as? SKLabelNode {
                self.removeAllActions()
                self.removeAllChildren()
                
                if touchNode.text! == matchingWord {
                    self.correctWordsCount += 1
                    showCorrectWordAlert()
                } else {
                    self.wrongWordsCount += 1
                    showWrongWordAlert()
                }
            }
        }
    }
    
}


