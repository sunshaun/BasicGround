//
//  ScrumsView.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        NavigationStack{
            List(scrums){ scrum in
                NavigationLink(destination: DetailView(scrum: scrum)){
                    CardView(scrum: scrum)
                        
                }.listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily")
            .toolbar {
                Button(action: {
                    print("btn that creat a new scrum!")
                }, label: {
                    Image(systemName: "plus")
                }).accessibilityLabel("New scrum")
            }
            
        }
        
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var scrums = DailyScrum.demoData
    static var previews: some View{
        ScrumsView(scrums: scrums)
    }
    
}

