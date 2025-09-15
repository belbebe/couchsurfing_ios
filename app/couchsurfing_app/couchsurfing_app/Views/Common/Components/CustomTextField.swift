//
//  CustomTextField.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 11/10/2023.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    
    @Binding var text: String
    
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder.opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
