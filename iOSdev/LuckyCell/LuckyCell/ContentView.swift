//
//  ContentView.swift
//  LuckyCell
//
//  Created by Fong on 3/18/24.
//

import SwiftUI
import FirebaseAuth


struct ContentView: View {
    let auth = Auth.auth()
    @State var btnState:String = "SignIn"


    var body: some View {
        VStack {
            Button(btnState) {
                if auth.currentUser == nil{
                    auth.signInAnonymously()
                    print("you signIn")
                } else{
                    auth.currentUser?.delete(completion: { error in
                        print("delete error: \(String(describing: error?.localizedDescription))")
                    })
                    print("you SignOut(delete)")
                }
            }.padding(.vertical, 5)
             .padding(.horizontal, 10)
             .background(Capsule().fill(Color.gray))
                 .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                 .lineLimit(1)
            .onAppear {
                auth.addStateDidChangeListener { auth, user in
                    if user == nil{
                        btnState = "SignIn"
                    } else {
                        btnState = "SignOut"
                    }
                }
            }
           
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
