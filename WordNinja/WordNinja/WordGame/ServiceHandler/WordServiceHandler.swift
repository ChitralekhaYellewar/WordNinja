//
//  WordServiceHandler.swift
//  WordNinja
//
//  Created by Chitralekha Yellewar on 10/06/19.
//  Copyright © 2019 Chitralekha Yellewar. All rights reserved.
//

import Foundation

class WordServiceHandler {
    
    //MARK: get words array for word ninja.
    func getWords() -> [Word]? {
        return WordsService.shared.getWordsData()
    }
}
