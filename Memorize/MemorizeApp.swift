//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Comus Hardman IV on 11/22/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

