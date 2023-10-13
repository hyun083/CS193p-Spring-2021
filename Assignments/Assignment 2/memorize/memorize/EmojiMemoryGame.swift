//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Hyun on 2023/09/14.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject{
    static let theme:[(title:String, color:Color, emojis:[String])] = [("vehicels",.gray,vehicles),("flowers",.green,flowers),("animals",.blue,animals),
                                                                       ("fruits",.orange,fruits),("sports",.red,sports),("buildings",.brown,buildings)]
    
    static let vehicles = ["🚗","🚌","🏎️","🚓","🚒","🛵","🛴","🚃","🚂","✈️","🛸","🚤"]
    static let flowers = ["🌷","🌹","🪻","🪷","🌺","🌸","🌼","🌻"]
    static let animals = ["🐥","🪿","🦆","🐦‍⬛","🦅","🦉","🦇","🐝","🐌","🐜","🐢","🦎","🦖","🦕",
                          "🐙","🦑","🦀","🐬","🐋","🦈","🐅","🦓","🦍","🐘","🫏","🦒","🐕","🐈","🐈‍⬛"]
    static let fruits = [ "🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍓","🫐","🍈","🍒","🍑","🥭","🍍","🥥","🥝","🍅","🍆","🥑","🫛"]
    static let sports = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🥏","🎱","🪀","🏓","🏸","🏒","🏑","🥍","🏏"]
    static let buildings = ["🏠","🏭","🏢","🏬","🏣","🏤","🏥","🏦","🏨","🏪","🏫","🏩","💒","🏛️"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        let currentTheme = theme[Int.random(in: 0..<theme.count)]
        
        return MemoryGame(titleOfTheGame: currentTheme.title, numberOfPairsOfCards: Int.random(in: 4..<currentTheme.emojis.count),
                          colorOfCards: currentTheme.color, CreateCardContent: { pairIndex in
            currentTheme.emojis[pairIndex]
        })
    }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card:MemoryGame<String>.Card){
        model.choose(card)
    }
    
    func CreateNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    var title: String{
        return model.title
    }
    
    var color: Color{
        return model.color
    }
    
    var score: Int{
        return model.score
    }
}
