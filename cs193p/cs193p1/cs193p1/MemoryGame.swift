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
  private(set) var cards: [Card]
    
    // mutating: calling this function is going to change something(current model should be variable: use var)
    mutating func choose(_ card: Card) {
      
      let choose_index = index(of: card)
      
      // it make a copy of this card, struct are copied around all over the place
      // var choose_card = cards[choose_index]

      cards[choose_index].isFaceUp.toggle()
      print("im choose: \n\(cards)")

  }
    func index(of card: Card) -> Int{
        card.id
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
