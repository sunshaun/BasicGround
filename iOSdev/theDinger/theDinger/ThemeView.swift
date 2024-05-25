//
//  ThemeView.swift
//  theDinger
//
//  Created by Fong on 4/7/24.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    var body: some View {
        Text(theme.name)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundColor(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        
            
        
    }
}

#Preview {
    ThemeView(theme: .sky)
}
