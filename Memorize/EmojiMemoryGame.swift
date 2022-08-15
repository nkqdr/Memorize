//
//  EmojiMemoryGame.swift
//  Memorize
//
//  This file implements the ViewModel
//
//  Created by Niklas Kuder on 14.08.22.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private var theme: Theme
    @Published private var model: MemoryGame<String>
    
    init(theme: Theme) {
        self.theme = theme
        self.model = MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards) { index in
            theme.emojis[index]
        }
    }
    
    var themeColor: Color {
        switch theme.color {
        case "blue":
            return .blue
        case "orange":
            return .orange
        case "green":
            return .green
        case "yellow":
            return .yellow
        default:
            return .red
        }
    }
    
    var themeName: String {
        theme.name
    }
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffleCards() {
        model.shuffle()
    }
    
    func newGame() {
        model.reset()
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
