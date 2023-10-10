//
//  ChatConversationView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 10/10/2023.
//

import SwiftUI

struct ChatConversationView: View {
    let chatPartner = ChatTitleRowUser(name: "Példa Béla", username: "pelda_bela", profilePicture: "figure.sailing")
    let messages = [ChatMessage(id: "id1", message: "Hello!", received: false, timestamp: Date()), ChatMessage(id: "id2", message: "Hello!", received: true, timestamp: Date()), ChatMessage(id: "id3", message: "Placeholder text", received: false, timestamp: Date()), ChatMessage(id: "id4", message: "Lorem ipsum", received: true, timestamp: Date())]
    
    var body: some View {
        VStack {
            VStack {
                ChatTitleRow(titleRowUser: chatPartner)
                    .background(Color("CouchSurfingChatTitleRow"))
                
                ScrollView {
                    ForEach(messages, id: \.self) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
            }
            
            MessageField()
        }
    }
}

#Preview {
    ChatConversationView()
}
