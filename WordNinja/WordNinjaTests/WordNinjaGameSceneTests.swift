//
//  WordNinjaGameSceneTests.swift
//  WordNinjaTests
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import XCTest
@testable import WordNinja

class WordNinjaGameSceneTests: XCTestCase {
    
    var gameScene : WordNinjaGameScene?
    
    override func setUp() {
        gameScene = WordNinjaGameScene()
    }

    override func tearDown() {
        gameScene = nil
    }

    func testGetPreviousGameDataWordToFindIndexFromPrevGame() {
        gameScene?.getPreviousGameData()
        guard let wordToFindIndexFromPrevGame = gameScene?.wordToFindIndex else { XCTFail(" wordToFindIndex should not be nil."); return; }
        XCTAssertNotNil(wordToFindIndexFromPrevGame)
    }
    
    func testGetPreviousGameDataGameLevelCountFromPrevGame() {
        gameScene?.getPreviousGameData()
        guard let gameLevelCountFromPrevGame = gameScene?.gameLevelCount else { XCTFail(" gameLevelCount should not be nil."); return; }
        XCTAssertNotNil(gameLevelCountFromPrevGame)
    }
    
    func testGetGameWords() {
        XCTAssertNotNil(gameScene?.getGameWords())
    }
    
    func testGetGameWordArrayCountWithValidWordsData() {
        testGetGameWords()
        guard let wordsCount = gameScene?.wordsViewModel?.words else { XCTFail(" words from view model should not be zero."); return;}
        XCTAssert( wordsCount.count > 0)
    }
    
    func testGetGameWordArrayCountWithNoData() {
        XCTAssertNil(gameScene?.wordsViewModel?.words)
    }
    
    func testRandomNotNil() {
        XCTAssertNotNil(gameScene?.random())
    }
    
    func testRandomWithSizeNotNil() {
        XCTAssertNotNil(gameScene?.random(min:10, max:100))
    }
    
    func testCreatePossibleMatchWordLabel() {
        XCTAssertNotNil(gameScene?.possibleMatchWordLabel)
    }
}
