//
//  ChatMessage.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 10/10/2023.
//

import Foundation

struct ChatMessage: Identifiable, Codable, Hashable {
    var id: String
    var message: String
    var received: Bool // is the current user the recipient
    var timestamp: Date
}
