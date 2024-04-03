//
//  DetailEditView.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    var body: some View {
        Form(content: {
            Section(header: Text("Meeting INFO")){
                TextField("title1", text: $scrum.title)
                HStack{
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 0...30, step: 1){
                        Text("Length")
                    }
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                    
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
