//
//  ContentView.swift
//  memorize
//
//  Created by Hyun on 2023/06/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 23.0)
                .stroke(lineWidth: 5)
            Text("Hello")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
