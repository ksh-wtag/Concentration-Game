//
//  ViewController.swift
//  StanfordTutorial2
//
//  Created by Kazi Shakawat Hossain Ratul on 14/5/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    var flipCount = 0 {
        didSet {
            countLabel.text = "Flips : \(flipCount)"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else {
            print("Card is not in the collection.")
        }
        
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp == false {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
            else {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = .white
            }
        }
    }
    
    var emojiChoices = ["😃","🥹", "🐪","👻","🦥","🐈"]
    var emoji = [Int: String]()
    
    func emoji(for card: Cards) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

