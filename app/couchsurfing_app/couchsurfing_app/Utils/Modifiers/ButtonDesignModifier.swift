//
//  ButtonDesignModifier.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 05. 02..
//

import SwiftUI

struct ButtonDesignModifier: ViewModifier {
    let button_color: Color
    let background_color: Color
    
    init(color: Color, background: Color) {
        self.button_color = color
        self.background_color = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background(button_color)
            .foregroundColor(.black)
            .cornerRadius(15)
            .padding(3)
            .background(background_color)
            .cornerRadius(15)
    }
}
