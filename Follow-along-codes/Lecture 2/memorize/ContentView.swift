//
//  ContentView.swift
//  memorize
//
//  Created by Hyun on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚",
                  "🚛","🚜","🛵","🏍️","🛺","🚔","🚍","🚘","🚖","✈️","🚤","🛥️"]
    
    @State var emojiCount = 24
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3,contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View{
        Button(action: {
            emojiCount -= emojiCount>1 ? 1:0
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var add: some View{
        Button(action: {
            emojiCount += emojiCount<emojis.count ? 1:0
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
}

struct CardView: View{
    var content = ""
    @State var isFaceUp: Bool = true
    
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 23.0)
        
        ZStack {
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
