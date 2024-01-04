//
//  MemoryGame.swift
//  cs193p1
//
//  Created by Fong on 1/2/24.
//

import Foundation

// <xxx> means Generics type
struct MemoryGame<Cardcontent> {

  // forbid external modify if set private(set)
  var cards: [Card]

  func choose(_ card: Card) {

  }

  init(PairsNumberOfCards: Int, createCardContent: (Int) -> Cardcontent) {
    cards = [Card]()
    for pairIndex in 0..<PairsNumberOfCards {
      let content: Cardcontent = createCardContent(pairIndex)
      cards.append(Card(content: content, id: pairIndex * 2))
      cards.append(Card(content: content, id: pairIndex * 2 + 1))
    }

  }

  struct Card: Identifiable {

    var isFaceUp: Bool = true
    var isMatched: Bool = false
    var content: Cardcontent
    var id: Int

  }
}
