//
//  ContentView.swift
//  memorize
//
//  Created by Hyun on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    static func widthThatBestFits(for width: CGFloat, cardCount: Int) -> CGFloat{
        return width/ceil(sqrt(CGFloat(cardCount)))-10
    }
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize your \(viewModel.title)!")
                .font(.largeTitle)
            Text("score: \(viewModel.score)")
                .font(.title2)
            VStack{
                GeometryReader{ geometry in
                    ScrollView{
                        let width = ContentView.widthThatBestFits(for: geometry.size.width, cardCount: viewModel.cards.count)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: width))], content: {
                            ForEach(viewModel.cards, content: {card in
                                CardView(card: card)
                                    .aspectRatio(2/3, contentMode: .fit)
                                    .onTapGesture {
                                        viewModel.choose(card)
                                    }
                            })
                        })
                    }
                    .foregroundColor(viewModel.color)
                    .padding(.vertical)
                }
                
                Button("New Game", action: {
                    viewModel.CreateNewGame()
                })
                .font(.title)
            }
            .padding(.horizontal)
        }
        
    }
}

struct CardView: View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 19)
        
        ZStack{
            if card.isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(card.content).font(.title)
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
        ContentView(viewModel: game)
    }
}
