//
//  ContentView.swift
//  memorize
//
//  Created by Hyun on 2023/06/30.
//

import SwiftUI

let vehicles = ["🚗","🚌","🏎️","🚓","🚒","🛵","🛴","🚃","🚂","✈️","🛸","🚤"]
let flowers = ["🌷","🌹","🪻","🪷","🌺","🌸","🌼","🌻"]
let animals = ["🐥","🪿","🦆","🐦‍⬛","🦅","🦉","🦇","🐝","🐌","🐜","🐢","🦎",
               "🦖","🦕","🐙","🦑","🦀","🐬","🐋","🦈","🐅","🦓","🦍","🐘",
               "🫏","🦒","🐕","🐈","🐈‍⬛"]

func widthThatBestFits(for width: CGFloat, cardCount: Int) -> CGFloat{
    return width/ceil(sqrt(CGFloat(cardCount)))-10
}

struct ContentView: View {
    @State var emojis = vehicles
    @State var emojiCount = Int.random(in: 4..<vehicles.count)
    
    func replaceCard(to arr:[String]){
        emojis = arr.shuffled()
        emojiCount = Int.random(in: 4..<arr.count)
    }
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            Spacer()
            
            GeometryReader{ geometry in
                ScrollView{
                    let width = widthThatBestFits(for: geometry.size.width, cardCount: emojiCount)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: width))], spacing: 7){
                        ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                            CardView(content:emoji)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .foregroundColor(.red)
            }
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action: { replaceCard(to: vehicles) }) {
                    Theme(title: "Vehicles", symbol: "car")
                }
                Spacer()
                Button(action: { replaceCard(to: flowers) }) {
                    Theme(title: "Flowers", symbol: "camera.macro")
                }
                Spacer()
                Button(action: { replaceCard(to: animals) }) {
                    Theme(title: "Animals", symbol: "pawprint")
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct Theme: View{
    let title: String
    let symbol: String
    
    var body: some View{
        VStack{
            Image(systemName: symbol)
                .font(.largeTitle)
            Text(title)
        }
        .font(.title3)
    }
}

struct CardView: View{
    @State var isFaceUp = true
    let content:String
    let shape = RoundedRectangle(cornerRadius: 17.0)
    
    var body: some View{
        ZStack{
            if isFaceUp{
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content)
                    .font(.largeTitle)
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
    }
}
