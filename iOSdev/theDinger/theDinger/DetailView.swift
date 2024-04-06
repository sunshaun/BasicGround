//
//  DetailView.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    @State private var isPresentEditView = false
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
                    Text("\(scrum.lengthInMinutesAsDouble)")
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
            .toolbar{
                Button("Edit") {
                    isPresentEditView = true
                }
            }
            .sheet(isPresented: $isPresentEditView, content: {
                NavigationStack{
                    DetailEditView()
                        .navigationTitle("Edit Detail")
                        .toolbar{
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentEditView = false
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    isPresentEditView = false
                                }
                            }
                            
                        }
                }
               
            })
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View{
        DetailView(scrum: DailyScrum.demoData[1])
    }
    
}
