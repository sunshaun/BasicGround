//
//  MemoryGame.swift
//  cs193p1
//
//  Created by Fong on 1/2/24.
//

import Foundation

// <xxx> means Generics type
struct MemoryGame<Cardcontent> where Cardcontent: Equatable{

  // forbid external modify if set private(set)
  private(set) var cards: [Card]
  private var IndexOfTheOneAndOnlyFaceUpCard: Int?
    
    // mutating: calling this function is going to change something(current model should be variable: use var)
    mutating func choose(_ card: Card) {
        // can not use "&&" when using "if let" statement, but "," is work
        if let choose_index = cards.firstIndex(where: {$0.id == card.id}),
            !cards[choose_index].isFaceUp,
            !cards[choose_index].isMatched {
            if let potentialMatchIndex = IndexOfTheOneAndOnlyFaceUpCard{
                if cards[choose_index].content == cards[potentialMatchIndex].content{
                    cards[choose_index].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                IndexOfTheOneAndOnlyFaceUpCard = nil
            } else{
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                IndexOfTheOneAndOnlyFaceUpCard = choose_index
            }
            
            cards[choose_index].isFaceUp.toggle()

        }
      
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
