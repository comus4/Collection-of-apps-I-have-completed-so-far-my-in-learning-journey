//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Comus Hardman IV on 11/23/22.
// ViewModel

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["✈️", "🚀", "🚁", "🚂", "💩", "🫥", "🥶", "👻", "👊", "🌝", "🪺", "🌪️", "🍶", "🤸🏻‍♀️", "🛒", "▼", "💌", "🏮", "📮", "📜", "📈", "📆", "🎊", "🎵", "🎶", "🥇"]
    
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intents(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    
}
