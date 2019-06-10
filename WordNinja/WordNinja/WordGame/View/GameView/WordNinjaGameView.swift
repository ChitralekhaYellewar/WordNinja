//
//  WordNinjaGameView.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import SpriteKit

extension WordNinjaGameScene {
    //MARK: get data from previous game played by user.
    func getPreviousGameData() {
        if let wordToFindIndexFromPrevGame = UserDefaults.standard.value(forKey: "wordToFindIndex") as? Int, let gameLevelCountFromPrevGame = UserDefaults.standard.value(forKey: "gameLevelCount") as? Int {
            wordToFindIndex = wordToFindIndexFromPrevGame
            gameLevelCount = gameLevelCountFromPrevGame
        } else {
            wordToFindIndex = 0
            gameLevelCount = 5
        }
    }
    
    //MARK: get game words stock.
    func getGameWords() {
        if let words = WordServiceHandler().getWords() {
            wordsViewModel = WordsViewModel(words: words)
        }
    }
    
    //MARK: set up game.
    func setUpGame() {
        getGameWords()
        if let words = wordsViewModel?.words {
            wordToFind = words[wordToFindIndex].text_eng
            matchingWord = words[wordToFindIndex].text_spa
            possibleMatchingWords.removeAll()
            for wordIndex in wordToFindIndex..<wordToFindIndex + 5 {
                possibleMatchingWords.append(words[wordIndex])
            }
            
            start(wordToFind: wordToFind)
        }
    }
    
    //MARK: start adding possible matching words to scene to pick up be user.
    func start(wordToFind: String) {
        backgroundColor = SKColor.white
        
        wordToFindLabel.position = CGPoint(x: size.width * 0.5, y: size.height * 0.1)
        wordToFindLabel.text = wordToFind
        wordToFindLabel.fontColor = SKColor.purple
        
        addChild(wordToFindLabel)
        
        if possibleMatchingWordIndex == 5 {
            possibleMatchingWordIndex = 0
        }
        
        run(SKAction.repeat(
            SKAction.sequence([
                SKAction.run(addPossibleMatchingWords),
                SKAction.wait(forDuration: 1.0)
                ]), count: possibleMatchingWords.count)
        )
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    //MARK: add possible matching words to scene.
    func addPossibleMatchingWords() {
        createPossibleMatchWordLabel()
        
        let actualx = random(min: possibleMatchWordLabel.frame.size.width/2, max: size.width - possibleMatchWordLabel.frame.size.width/2)
        
        possibleMatchWordLabel.position = CGPoint(x: actualx , y: size.height + possibleMatchWordLabel.frame.size.height/2)
        
        addChild(possibleMatchWordLabel)
        
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(15.0))
        
        let actionMove = SKAction.move(to: CGPoint(x: actualx, y: possibleMatchWordLabel.frame.size.height),
                                       duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        
        let loseAction = SKAction.run() { [weak self] in
            guard let `self` = self else { return }
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let gameOverScene = WordNinjaGameOverScene(size: self.size, won: false)
            self.view?.presentScene(gameOverScene, transition: reveal)
        }
        possibleMatchWordLabel.run(SKAction.sequence([actionMove, loseAction, actionMoveDone]))
        
    }
    
    func createPossibleMatchWordLabel() {
        possibleMatchWordLabel = SKLabelNode(text: possibleMatchingWords[possibleMatchingWordIndex].text_spa)
        
        if possibleMatchingWordIndex < 5 {
            possibleMatchingWordIndex += 1
        }
        possibleMatchWordLabel.fontColor = SKColor.black
        possibleMatchWordLabel.fontSize = 30
        possibleMatchWordLabel.fontName = "AmericanTypewriter-Bold"
        
    }
    
    //MARK: go To Next Level Of Game Or Start Over the game.
    func goToNextLevelOfGameOrStartOver() {
        self.possibleMatchingWordIndex = 0
        if self.wordToFindIndex < self.gameLevelCount {
            self.wordToFindIndex += 1
            self.setUpGame()
        } else {
            if self.wordToFindIndex == self.gameLevelCount {
                showGameOverScene()
            }
        }
    }
    
    //MARK: game over.
    
    func showGameOverScene() {
        self.gameLevelCount += 5
        UserDefaults.standard.set(self.gameLevelCount, forKey: "gameLevelCount")
        UserDefaults.standard.set(self.wordToFindIndex, forKey: "wordToFindIndex")
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        let gameOverScene = WordNinjaGameOverScene(size: self.size, won: true, correct: correctWordsCount, wrong: wrongWordsCount)
        self.view?.presentScene(gameOverScene, transition: reveal)
    }

    //MARK: show correct msg alert.
    func showCorrectWordAlert() {
        let correctAlert = UIAlertController(title: Constants.CORRECT, message: Constants.EMPTY, preferredStyle: .alert)
        correctAlert.addAction(UIAlertAction(title: Constants.NEXT, style: .default, handler: { nextWord in
            self.goToNextLevelOfGameOrStartOver()
        }))
        showAlert(type: correctAlert)
    }
    
    //MARK: show wrong word alert.
    func showWrongWordAlert() {
        let wrongAlert = UIAlertController(title: Constants.WRONG, message: Constants.EMPTY, preferredStyle: .alert)
        wrongAlert.addAction(UIAlertAction(title: Constants.TRY_AGAIN, style: .default, handler: { playAgain in
            self.goToNextLevelOfGameOrStartOver() //chek here.
        }))
        showAlert(type: wrongAlert)
    }
    
    func showAlert(type: UIAlertController) {
        if let presentView = self.viewController {
            presentView.present(type, animated: true, completion: nil)
        } else if let presentView = self.view?.window?.rootViewController {
            presentView.present(type, animated: true, completion: nil)
        }
    }
}
