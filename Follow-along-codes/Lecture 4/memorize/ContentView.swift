//
//  ContentView.swift
//  memorize
//
//  Created by Hyun on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var ViewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                ForEach(ViewModel.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3,contentMode: .fit)
                        .onTapGesture {
                            ViewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 23.0)
        
        ZStack {
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.Content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }else{
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(ViewModel: game)
            .preferredColorScheme(.dark)
        ContentView(ViewModel: game)
            .preferredColorScheme(.light)
    }
}
