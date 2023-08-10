//
//  memorizeApp.swift
//  memorize
//
//  Created by Hyun on 2023/07/02.
//

import SwiftUI

@main
struct memorizeApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(ViewModel: game)
        }
    }
}
