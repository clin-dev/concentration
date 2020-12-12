//
//  Card.swift
//  concentration
//
//  Created by Chao Lin on 5/6/20.
//  Copyright © 2020 Chao Lin. All rights reserved.
//

import Foundation

//struct is value typed
//when pass around in code, it gets copied
struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    //UI independent so it can't have emoji
    
    static var identifierFactory = 0
    /* You can only call this using Card.getUniqIdentifier*/
    static func getUniqIdentifier() -> Int {
        //can access static var w/o Card. because in a static func
        identifierFactory += 1
        return identifierFactory
    }
    
    //init tends to have same internal and external name
    init() {
        self.identifier = Card.getUniqIdentifier()
    }
}
