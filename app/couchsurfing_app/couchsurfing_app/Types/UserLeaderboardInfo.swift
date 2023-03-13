//
//  UserLeaderboardInfo.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 28..
//

import Foundation

struct UserLeaderboardInfo: Hashable, Identifiable {
    var name_text: String
    var score: Int
    var id: UUID = UUID()
}
