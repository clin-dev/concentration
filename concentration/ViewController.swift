//
//  ViewController.swift
//  concentration
//
//  Created by Chao Lin on 5/5/20.
//  Copyright © 2020 Chao Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //lazy means doesn't initialize until someone uses it
    //lazy cannot have didSet()
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int { //get only property
        return (cardButtons.count + 1) / 2
    }
    var theme = Themes()
    lazy var emojiChoices = theme.genRandomTheme()
    var emoji = [Int:String]() //dictionary
    
    //! means ...
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet weak var pointCountLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    //if you misspelled, press command and click name -> rename
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        //! at the end means assume this optional is set and grab the set value
        //let cardNum = cardButtons.firstIndex(of: sender)!
        //or
        if let cardNum = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNum)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            let emo = emoji(for: card)
            if card.isFaceUp {
                button.setTitle(emo, for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            }
        }
        pointCountLabel.text = "Points: \(game.score)"
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = theme.genRandomTheme()
        emoji = [Int:String]() //dictionary
        updateViewFromModel()
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
                let randomIndex = emojiChoices.count.arc4random
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        
        return emoji[card.identifier] ?? "?"
    }
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
 
