//
//  MemoryGame.swift
//  Memorize
//
//  This serves as the model for Memorize
//
//  Created by Niklas Kuder on 14.08.22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly}
        set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue)}) }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: 2 * pairIndex, content: content))
            cards.append(Card(id: 2 * pairIndex + 1, content: content))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id}),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            if let potentialMatchindex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[potentialMatchindex].content == cards[chosenIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchindex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        let id: Int
        let content: CardContent
        var isFaceUp = false
        var isMatched = false
    }
}


extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        }
        return nil
    }
}
