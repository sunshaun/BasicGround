//
//  ThemePicker.swift
//  theDinger
//
//  Created by Fong on 4/7/24.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection:  Theme
    
    var body: some View {
        Picker("theme", selection: $selection) {
            ForEach(Theme.allCases){ theme in
                ThemeView(theme: theme)
                    .tag(theme)
                
            }
        }.pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.magenta))
}
