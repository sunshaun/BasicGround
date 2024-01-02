//
//  ContentView.swift
//  cs193p1
//
//  Created by Fong on 1/1/24.
//

import SwiftUI

struct ContentView: View {
  var emojis = [
    "🦼", "🚡", "🚨", "🚛", "🚗", "🚝", "🚞", "🚋", "🚃", "🚖", "🚑", "🚟", "🎾", "🏒", "🎱", "🏓", "🏉", "⚾️", "🏈",
    "🏀",
  ]
  // @State makes variable as a pointer
  @State var emojicount = 20
  var body: some View {
    VStack {
      ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 87))]) {
          // id parameter: for identify
          ForEach(emojis[0..<emojicount], id: \.self) {
            emoji in
            CardView(content: emoji).aspectRatio(2 / 3, contentMode: .fit)
          }
        }.foregroundColor(.red)
      }
    }
  }
}

struct CardView: View {
  @State var isFaceup = true
  var content: String
  var body: some View {
    let shape = RoundedRectangle(cornerRadius: 20)

    ZStack {
      if isFaceup {
        shape.fill(.white)
        shape.strokeBorder(lineWidth: 3)
        Text(content).font(.largeTitle)
      } else {
        shape.fill()
      }
    }.onTapGesture {
      isFaceup = !isFaceup
    }
  }
}

#Preview {
  ContentView()
  //    dark mode
  //    .preferredColorScheme(.dark)

}
