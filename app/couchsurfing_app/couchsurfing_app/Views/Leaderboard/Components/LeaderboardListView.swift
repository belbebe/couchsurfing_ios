//
//  LeaderboardListView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 01..
//

import SwiftUI

struct LeaderboardListView: View {
    let leaderBoardInfo: [UserLeaderboardInfo]
    
    init(leaderBoardInfo: [UserLeaderboardInfo]) {
        self.leaderBoardInfo = leaderBoardInfo
    }
    
    var body: some View {
        List {
            ForEach(0..<leaderBoardInfo.count) { index in
                LeaderboardListItemView(userInfo: leaderBoardInfo[index])
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    LeaderboardListView(leaderBoardInfo: [])
}
