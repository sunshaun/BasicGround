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
      
        if let choose_index = index(of: card) {
            
            cards[choose_index].isFaceUp.toggle()
            print("im choose: \n\(choose_index)")

        }
      

    
  }
    func index(of card: Card) -> Int?{
        for index in 0..<cards.count{
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
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

    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var content: Cardcontent
    var id: Int

  }
}
