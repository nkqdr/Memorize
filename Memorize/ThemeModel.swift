//
//  ThemeModel.swift
//  Memorize
//
//  Created by Niklas Kuder on 14.08.22.
//

import Foundation

protocol Theme {
    var name: String { get }
    var emojis: [String] { get }
    var numberOfPairsOfCards: Int { get }
    var color: String { get }
}

struct VehicleTheme: Theme {
    var name: String = "Vehicles"
    var emojis: [String] = ["✈️", "🚄", "🚤", "🚗", "🚐", "🚀", "🚢", "🏍", "🚜", "🛵"]
    var numberOfPairsOfCards: Int = 10
    var color: String = "blue"
}

struct HalloweenTheme: Theme {
    var name: String = "Halloween"
    var emojis: [String] = ["👻", "💀", "🎃", "🕸", "🕷", "🔪", "🗡", "🧟‍♂️"]
    var numberOfPairsOfCards: Int = 8
    var color: String = "orange"
}

struct FoodTheme: Theme {
    var name: String = "Food"
    var emojis: [String] = ["🎂", "🥯", "🍔", "🍅", "🥝", "🍓", "🌭", "🥂", "🍌", "🧀", "🍒", "🥜"]
    var numberOfPairsOfCards: Int = 12
    var color: String = "green"
}

struct FacesTheme: Theme {
    var name: String = "Faces"
    var emojis: [String] = ["😀", "🥹", "😂", "😜", "🤩", "🥸", "😔", "🥶", "🤑"]
    var numberOfPairsOfCards: Int = 9
    var color: String = "yellow"
}
