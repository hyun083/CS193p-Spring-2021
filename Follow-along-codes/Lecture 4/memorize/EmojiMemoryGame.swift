//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Hyun on 2023/07/10.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚",
                  "🚛","🚜","🛵","🏍️","🛺","🚔","🚍","🚘","🚖","✈️","🚤","🛥️"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(number0fPairsOfCards: 4){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
