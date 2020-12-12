//
//  Concentration.swift
//  concentration
//
//  Created by Chao Lin on 5/6/20.
//  Copyright © 2020 Chao Lin. All rights reserved.
//

import Foundation

//class is reference typed
//when pass around, pointer is passed
//MODEL
class Concentration {
    var cards = [Card]() //creates empty array
    var indexOfOneAndOnlyFaceUpCard: Int?
    var gameEnded: Bool
    var totalPair: Int
    var matchedPairCount: Int
    //instance variables == properties
    //all instance variables must be initialized
    var flipCount: Int
    var seenCards = [Int:Bool]()
    var score = 0
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            flipCount += 1
            
            if seenCards[index] != nil {
                seenCards[index] = true
            } else {
                seenCards[index] = false
            }
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    matchedPairCount += 1
                    score += 2
                } else {
                    if seenCards[index]! {
                        score -= 1
                    }
                    if seenCards[matchIndex]! {
                        score -= 1
                    }
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                //turn all cards down
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
            if matchedPairCount == totalPair {
                gameEnded = true
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        gameEnded = false
        matchedPairCount = 0
        totalPair = numberOfPairsOfCards
        flipCount = 0
        score = 0
        seenCards = [Int:Bool]()
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            //let matchingCard = card //this is fine, because card is a struct
            cards.append(card)
            cards.append(card) //copying structs
            //or cards += [card, card]
        }
        cards.shuffle()
    }
}
