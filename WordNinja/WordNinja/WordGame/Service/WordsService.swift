//
//  WordsService.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import Foundation

class WordsService {
    static let shared = WordsService()
    
    //MARK: get words from JSON.
    public func getWordsData() -> [Word]? {
        if let wordsJsonUrl = Bundle.main.url(forResource: "words", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: wordsJsonUrl)
                let wordsData = try JSONDecoder().decode([Word].self, from: jsonData)
                return wordsData
            } catch {
                print(error)
            }
        }
        return nil
    }
}
