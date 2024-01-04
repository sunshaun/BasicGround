//
//  ContentView.swift
//  cs193p1
//
//  Created by Fong on 1/1/24.
//

import SwiftUI

struct ContentView: View {
  var viewModel: EmojiMemoryGame
  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 87))]) {
          // id parameter: for identify
          ForEach(viewModel.cards) {
            card in
            CardView(card: card).aspectRatio(2 / 3, contentMode: .fit)
          }
        }.foregroundColor(.red)
      }
    }
  }
}

struct CardView: View {
  var card: MemoryGame<String>.Card
  var body: some View {
    let shape = RoundedRectangle(cornerRadius: 20)

    ZStack {
      if card.isFaceUp {
        shape.fill(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(card.content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let game = EmojiMemoryGame()
    ContentView(viewModel: game)
  }
}
