//
//  LeaderboardModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 02/12/2023.
//

import Foundation
import SwiftData

@Model
class LeaderboardModel {
    var user_id: Int
    var full_name: String
    var username: String
    var score: Float
    
    init(user_id: Int, full_name: String, username: String, score: Float) {
        self.user_id = user_id
        self.full_name = full_name
        self.username = username
        self.score = score
    }
}
