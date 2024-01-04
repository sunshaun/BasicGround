//
//  cs193p1App.swift
//  cs193p1
//
//  Created by Fong on 1/1/24.
//

import SwiftUI

@main
struct cs193p1App: App {
  let game = EmojiMemoryGame()
  var body: some Scene {
    WindowGroup {
      ContentView(viewModel: game)
    }
  }
}
