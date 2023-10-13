//
//  MemotyGame.swift
//  memorize
//
//  Created by Hyun on 2023/09/14.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent:Equatable{
    private (set) var title : String
    private (set) var cards : Array<Card>
    private (set) var color : Color
    private (set) var score : Int
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
    mutating func choose(_ card:Card){
        if let choosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[choosenIndex].isFaceUp, !cards[choosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if cards[choosenIndex].content == cards[potentialMatchIndex].content{
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }else{
                    if cards[choosenIndex].alreadyBeenSeen {
                        score -= 1
                    }else{
                        cards[choosenIndex].alreadyBeenSeen = true
                    }
                    
                    if cards[potentialMatchIndex].alreadyBeenSeen{
                        score -= 1
                    }else{
                        cards[potentialMatchIndex].alreadyBeenSeen = true
                    }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = choosenIndex
            }
            cards[choosenIndex].isFaceUp.toggle()
        }
    }
    
    init(titleOfTheGame:String, numberOfPairsOfCards:Int, colorOfCards: Color, CreateCardContent: (Int) -> CardContent){
        title = titleOfTheGame
        color = colorOfCards
        cards = Array<Card>()
        score = 0
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = CreateCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var alreadyBeenSeen: Bool = false
    }
}
