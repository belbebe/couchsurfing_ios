//
//  DisableScrollingModifier.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 03. 27..
//

import SwiftUI

struct DisableScrolling: ViewModifier {
    var disabled: Bool
        
    func body(content: Content) -> some View {
    
        if disabled {
            content
                .simultaneousGesture(DragGesture(minimumDistance: 0), including: .all)
        } else {
            content
        }
        
    }
}
