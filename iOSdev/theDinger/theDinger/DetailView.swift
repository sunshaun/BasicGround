//
//  DetailView.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    var body: some View {
        List{
            Section("Meeting Detail") {
            
                    NavigationLink(destination: MeetingView()) {
                        Label("Start Meeting", systemImage: "timer")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                    }
                
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes)")
                }.accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text("\(scrum.theme.name)")
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(.rect(cornerRadius: 6))
                }.accessibilityElement(children: .combine)
            }
            
            Section("Attendees") {
                ForEach(scrum.attendees) { person in
                    Label("\(person.name)", systemImage: "person")
                }
            }
        }.navigationTitle("\(scrum.title)")
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View{
        DetailView(scrum: DailyScrum.demoData[1])
    }
    
}
