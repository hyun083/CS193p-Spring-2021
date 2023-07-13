//
//  MemoryGame.swift
//  memorize
//
//  Created by Hyun on 2023/07/10.
//

import Foundation

struct MemoryGame<CardContent> {
    private (set) var cards : Array<Card>
    
    func choose(){
        
    }
    
    init(number0fPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<number0fPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(Content: content))
            cards.append(Card(Content: content))
        }
    }
    
    struct Card{
        var isfaceUp: Bool = false
        var isMatched: Bool = false
        var Content: CardContent
    }
}
