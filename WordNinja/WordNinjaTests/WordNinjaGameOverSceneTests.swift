//
//  WordNinjaGameOverSceneTests.swift
//  WordNinjaTests
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import XCTest
@testable import WordNinja

class WordNinjaGameOverSceneTests: XCTestCase {
    
    var gameOverScene: WordNinjaGameOverScene?
    
    var sceneSize = CGSize(width: 100, height: 100)
    var correctWords = 4
    var wrongWords = 1
    var gameWon = false

    override func setUp() {
        gameOverScene = WordNinjaGameOverScene(size: sceneSize, won: gameWon, correct: correctWords, wrong: wrongWords)
    }

    override func tearDown() {
        gameOverScene = nil
    }

    func testInitWithSizeAndWinTrue() {
        gameOverScene = WordNinjaGameOverScene(size: CGSize(width: 100, height: 100), won: true)
        XCTAssertNotNil(gameOverScene)
    }
    
    func testInitWithSizeAndWinFalse() {
        gameOverScene = WordNinjaGameOverScene(size: CGSize(width: 100, height: 100), won: true)
        XCTAssertNotNil(gameOverScene)
    }
    
    func testInitWithSizeAndWinAndCorrectAndWrong() {
        gameOverScene = WordNinjaGameOverScene(size: CGSize(width: 100, height: 100), won: true, correct: 5, wrong: 0)
    }
    
    func testsetUpGameOver() {
        gameOverScene?.setUpGameOver(size: sceneSize, won: gameWon, correct: correctWords, wrong: wrongWords)
    }
    
}
