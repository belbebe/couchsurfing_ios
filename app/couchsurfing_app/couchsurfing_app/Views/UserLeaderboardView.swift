//
//  UserLeaderboardView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 27..
//

import SwiftUI

struct UserLeaderboardView: View {
    let user_info: UserLeaderboardInfo
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer(minLength: 20)
            
            VStack(alignment: .leading) {
                Text(user_info.name_text)
                    .font(Font.body.weight(.bold))
                Text("Pontszám: \(user_info.score)")
                    .font(.body)
            }
        }
        .padding()
    }
}

struct UserLeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        UserLeaderboardView(user_info: UserLeaderboardInfo(name_text: "Minta Béla", score: 1530))
    }
}
