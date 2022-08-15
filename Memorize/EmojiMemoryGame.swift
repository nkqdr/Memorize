//
//  EmojiMemoryGame.swift
//  Memorize
//
//  This file implements the ViewModel
//
//  Created by Niklas Kuder on 14.08.22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["✈️", "🚄", "🚤", "🚗", "🚐", "🚀", "🚢", "🏍"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            emojis[index]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
