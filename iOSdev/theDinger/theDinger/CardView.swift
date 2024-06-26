//
//  CardView.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading){
            Text(scrum.title).font(.headline)
                .accessibilityAddTraits(.isHeader)
            HStack{
                
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.myLabel)
                    .padding(.trailing, 20)
                    
                    
            }.font(.caption)

        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        
    }
}


struct CardView_Previews: PreviewProvider{
    static var scrum = DailyScrum.demoData[1]
    
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
    
    
}
