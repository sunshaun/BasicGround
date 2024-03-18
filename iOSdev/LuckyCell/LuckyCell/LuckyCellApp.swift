//
//  LuckyCellApp.swift
//  LuckyCell
//
//  Created by Fong on 3/18/24.
//

import SwiftUI
import FirebaseAuth
@main
struct LuckyCellApp: App {
    // register app delegate for Firebase setup
     @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
 

}
