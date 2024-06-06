//
//  Cards.swift
//  StanfordTutorial2
//
//  Created by Kazi Shakawat Hossain Ratul on 14/5/24.
//

import Foundation

struct Cards {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0

    static func getUniqueIndetifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Cards.getUniqueIndetifier()
    }
}


