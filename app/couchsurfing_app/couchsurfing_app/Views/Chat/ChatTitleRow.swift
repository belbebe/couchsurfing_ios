//
//  ChatTitleRow.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 09/10/2023.
//

import SwiftUI

struct ChatTitleRow: View {
    let titleRowUser: ChatTitleRowUser
    
    var body: some View {
        HStack(spacing: 20) {
            // AsyncImage is needed if the image is loaded via URL from the internet
            Image(systemName: titleRowUser.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text(titleRowUser.name)
                    .font(.title).bold()
                
                if let unwrappedUsername: String = titleRowUser.username {
                    Text(unwrappedUsername)
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

#Preview {
    ChatTitleRow(titleRowUser: ChatTitleRowUser(name: "Példa Béla", profilePicture: "person.circle"))
        .background(Color("CouchSurfingChatTitleRow"))
}
