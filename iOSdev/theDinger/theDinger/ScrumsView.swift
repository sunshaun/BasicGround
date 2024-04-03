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
        List(scrums){ scrum in
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
            }
    }
}


struct ScrumsView_Previews: PreviewProvider {
    static var scrums = DailyScrum.demoData
    static var previews: some View{
        ScrumsView(scrums: scrums)
    }
    
}

