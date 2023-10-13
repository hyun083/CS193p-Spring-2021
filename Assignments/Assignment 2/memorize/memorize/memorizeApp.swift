//
//  memorizeApp.swift
//  memorize
//
//  Created by Hyun on 2023/09/12.
//

import SwiftUI

@main
struct memorizeApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
