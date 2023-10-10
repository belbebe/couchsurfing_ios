//
//  MessageField.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 11/10/2023.
//

import SwiftUI

struct MessageField: View {
    let messageFieldPlaceholder = "Írd ide az üzeneted!"
    
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text(messageFieldPlaceholder), text: $message)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("CouchSurfingChatBubbleReceived"), lineWidth: 2))
            
            Button {
                print("Message sent!")
                message = ""
            } label: {
                Image(systemName: "arrow.up")
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
                    .padding(10)
                    .background(Color("CouchSurfingBase"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
    }
}

#Preview {
    MessageField()
}
