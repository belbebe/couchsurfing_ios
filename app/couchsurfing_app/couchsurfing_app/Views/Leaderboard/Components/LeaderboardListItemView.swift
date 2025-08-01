//
//  LeaderboardListItemView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 27..
//

import SwiftUI

struct LeaderboardListItemView: View {
    let userInfo: UserLeaderboardInfo
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer(minLength: 20)
            
            VStack(alignment: .leading) {
                Text(userInfo.name_text)
                    .font(Font.body.weight(.bold))
                Text("Pontszám: \(userInfo.score)")
                    .font(.body)
            }
        }
        .padding()
    }
}

struct LeaderboardListItemView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardListItemView(userInfo: UserLeaderboardInfo(name_text: "Minta Béla", score: 1530))
    }
}
