//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Hyun on 2023/07/10.
//

import SwiftUI

class EmojiMemoryGame{
    static let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚",
                  "🚛","🚜","🛵","🏍️","🛺","🚔","🚍","🚘","🚖","✈️","🚤","🛥️"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(number0fPairsOfCards: 4){ pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards : Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
