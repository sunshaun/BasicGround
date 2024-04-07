//
//  DetailEditView.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var newAttendeeName = ""
    var body: some View {
        Form(content: {
            Section(header: Text("Meeting INFO")){
                TextField("title1", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 0...30, step: 1){
                        Text("Length")
                    }.accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }.accessibilityHidden(true)
                ThemePicker(selection: $scrum.theme)
                
            }
            Section(header: Text("Attendees")){
                
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete(perform: { indexSet in
                    scrum.attendees.remove(atOffsets: indexSet)
                })
                
                HStack{
                    TextField("New name", text: $newAttendeeName)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle")
                            .accessibilityLabel("Add attendee")
                    })
                    .disabled(newAttendeeName.isEmpty)
                }
            }
            
        })
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
