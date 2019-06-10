//
//  WordNinjaServiceTests.swift
//  WordNinjaTests
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import XCTest
@testable import WordNinja

class WordNinjaServiceTests: XCTestCase {
    
    var serviceHandler : WordServiceHandler?
    
    var testWord: Word?

    override func setUp() {
        serviceHandler = WordServiceHandler()
        testWord = Word(text_eng: "primary school", text_spa: "escuela primaria")
    }

    override func tearDown() {
        serviceHandler = nil
        testWord = nil
    }

    //MARK: test for Word Service Handler getWords() Not Nil.
    func testWordServiceHandlerNotNil() {
        XCTAssertNotNil(serviceHandler?.getWords())
    }
    
    func testWordFromJSON() {
        if let wordsArray = serviceHandler?.getWords() {
            for words in wordsArray {
                if words.text_eng == testWord!.text_eng {
                    XCTAssert(true)
                }
            }
        }
    }
    
}
