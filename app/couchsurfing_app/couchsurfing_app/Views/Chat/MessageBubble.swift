//
//  MessageBubble.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 10/10/2023.
//

import SwiftUI

struct MessageBubble: View {
    let message: ChatMessage
    @State private var isTimeShown = false
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.message)
                    .padding()
                    .background(message.received ? Color("CouchSurfingChatBubbleReceived") : Color("CouchSurfingChatBubbleSent"))
                    .cornerRadius(25)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing) // even with long texts, the bubble won't be too long
            .onTapGesture {
                isTimeShown.toggle()
            }
            
            if isTimeShown {
                Text("\(message.timestamp.formatted(.dateTime.year().month().day().hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 15)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 5)
    }
}

#Preview {
    MessageBubble(message: ChatMessage(id: "1234", message: "Placeholder message", received: false, timestamp: Date()))
}
