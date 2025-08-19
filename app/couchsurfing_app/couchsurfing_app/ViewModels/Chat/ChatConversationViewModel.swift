//
//  ChatConversationViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 19..
//

import Foundation
import SwiftUI

@MainActor
public class ChatConversationViewModel: ObservableObject {
    @Published var data: Data = Data()
    
    func sendButtonTapped() {
        // TODO: implement message sending with BE integration
        print("Message sent!")
        data.textField = ""
    }
}

// MARK: - Data
extension ChatConversationViewModel {
    public class Data {
        // TODO: use data from BE
        let chatPartner: User = User(
            name: "Példa Géza",
            username: "pelda_geza",
            birthDate: Date(),
            email: "pelda.geza@example.com",
            phoneNumber: "123456789",
            profilePicture: "figure.sailing"
        )
        var messages: [ChatMessage] = [
            ChatMessage(id: "id1", message: "Hello!", received: false, timestamp: Date()),
            ChatMessage(id: "id2", message: "Hello!", received: true, timestamp: Date()),
            ChatMessage(id: "id3", message: "Placeholder text", received: false, timestamp: Date()),
            ChatMessage(id: "id4", message: "Lorem ipsum", received: true, timestamp: Date())
        ]
        var textField: String = ""
    }
}
