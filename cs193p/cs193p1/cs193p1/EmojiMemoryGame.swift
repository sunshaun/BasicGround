//
//  EmojiMemoryGame.swift
//  cs193p1
//
//  Created by Fong on 1/2/24.
//

import SwiftUI

func makeCardContent(index: Int) -> String {
  return "🥹"
}

class EmojiMemoryGame {

  // if use static announce, variable name need classname prefix like this: EmojiMemoryGame.emojis(can be omitted in initialazation and static function)
  static let emojis = [
    "🦼", "🚡", "🚨", "🚛", "🚗", "🚝", "🚞", "🚋", "🚃", "🚖", "🚑", "🚟", "🎾", "🏒", "🎱", "🏓", "🏉", "⚾️", "🏈",
    "🏀",
  ]

  // closure example, keywords is "in"
  //  = MemoryGame<String>(PairsNumberOfCards: 4, createCardContent: {(index: Int) -> String in return "🥹"})
  // some trick
  //  = MemoryGame<String>(PairsNumberOfCards: 4) {_ in "👌"}
  static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(PairsNumberOfCards: 4) { pairIndex in emojis[pairIndex] }
  }

  // initialazation. and annouce private can protect model
  private var model: MemoryGame<String> = createMemoryGame()
  var cards: [MemoryGame<String>.Card] {
    return model.cards
  }

}
