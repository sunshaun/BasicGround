//
//  ContentView.swift
//  theDinger
//
//  Created by Fong on 4/2/24.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        
        VStack(){
            ProgressView(value: 4.5, total: 10)
            HStack {
                VStack(alignment: .leading){
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }.accessibilityElement(children: .ignore)
                .accessibilityLabel("timers remaining")
                .accessibilityValue("10 minutes")
            Circle()
                .strokeBorder(lineWidth: 20)
            
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {
                    print("button!")
                }, label: {
                    Image(systemName: "forward.fill")
                }).accessibilityLabel("Next speaker")
                
            }
        }.padding()
        
    }
}

#Preview {
    MeetingView()
}
