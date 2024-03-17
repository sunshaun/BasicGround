//
//  ContentView.swift
//  theSwiftUI
//
//  Created by Fong on 3/17/24.
//

import SwiftUI

struct ContentView: View {
    @State var red = 50.0
    @State var green = 50.0
    @State var blue = 50.0
    var body: some View {
        VStack{
            Text("Paint")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            
            ZStack{
                Color(red: red / 255, green: green / 255, blue: blue / 255)
                VStack{
                    LabeledContent("") {
                        HStack{
                            VStack{
                                Text("R:\(String(format: "%.f", red))").font(.title2)
                                Slider(value: $red, in: 0...255)

                            }
                            VStack{
                                Text("G:\(String(format: "%.f", green))").font(.title2)
                                Slider(value: $green, in: 0...255)

                            }
                            VStack{
                                Text("B:\(String(format: "%.f", blue))").font(.title2)
                                Slider(value: $blue, in: 0...255)

                            }
                        }
                    }.padding()
                Spacer()
                }
                
            }.background(Color.gray)
            Spacer()
        }

    }

}


#Preview {
    ContentView()
}
