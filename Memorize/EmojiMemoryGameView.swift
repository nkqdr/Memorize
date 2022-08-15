//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Niklas Kuder on 31.12.21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: DrawingConstants.cardAspectRatio) { card in
            CardView(card: card)
                .padding(DrawingConstants.cardPadding)
                .onTapGesture {
                    game.choose(card)
                }
        }
        .padding(.horizontal)
        .foregroundColor(game.themeColor)
        .navigationTitle(game.themeName)
        .toolbar {
            Button("New game") {
                game.newGame()
            }
        }
    }
    
    private struct DrawingConstants {
        static let cardPadding: CGFloat = 4
        static let cardAspectRatio: CGFloat = 2/3
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: DrawingConstants.pieStartAngle), endAngle: Angle(degrees: 20))
                        .padding(DrawingConstants.piePadding)
                        .opacity(DrawingConstants.pieOpacity)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(DrawingConstants.matchedCardOpacity)
                } else {
                    shape
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: DrawingConstants.fontScale * min(size.width, size.height))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 15
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.7
        static let matchedCardOpacity: CGFloat = 0
        static let pieOpacity: CGFloat = 0.5
        static let piePadding: CGFloat = 5
        static let pieStartAngle: Double = -90
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame(theme: VehicleTheme())
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
    }
}
