//
//  AccommodationDetialsKeyValueView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 28..
//

import SwiftUI

struct AccommodationDetialsKeyValueView: View {
    let key: String
    let value: String
    let alignment: VerticalAlignment
    
    init(key: String, value: String, alignment: VerticalAlignment = .center) {
        self.key = key
        self.value = value
        self.alignment = alignment
    }
    
    var body: some View {
        HStack(alignment: alignment) {
            Text(key)
                .bold()
            
            Text(value)
        }
    }
}

#Preview {
    AccommodationDetialsKeyValueView(key: "Kulcs", value: "Érték")
}
