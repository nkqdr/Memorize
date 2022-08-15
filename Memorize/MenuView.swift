//
//  MenuView.swift
//  Memorize
//
//  Created by Niklas Kuder on 15.08.22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        let themes: [Theme] = [VehicleTheme(), HalloweenTheme(), FoodTheme(), FacesTheme()]
        
        NavigationView {
            List {
                Section("Emoji themes") {
                    ForEach(themes, id: \.name) { theme in
                        NavigationLink(theme.name) {
                            EmojiMemoryGameView(game: EmojiMemoryGame(theme: theme))
                        }
                    }
                }
            }
            .navigationTitle("Memorize")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
