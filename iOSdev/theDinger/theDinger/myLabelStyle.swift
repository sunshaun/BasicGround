//
//  myLabel.swift
//  theDinger
//
//  Created by Fong on 4/3/24.
//

import SwiftUI

struct myLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.icon
            configuration.title
            configuration.icon
        }
     
    }
}

extension LabelStyle where Self == myLabelStyle {
    
    static var myLabel: Self {Self ()}
    
}
