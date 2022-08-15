//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Niklas Kuder on 31.12.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
