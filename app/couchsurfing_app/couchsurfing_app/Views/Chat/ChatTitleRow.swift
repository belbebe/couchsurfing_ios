//
//  ChatTitleRow.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 09/10/2023.
//

import SwiftUI

struct ChatTitleRow: View {
    @ObservedObject private var viewModel: ChatConversationViewModel
    
    init(viewModel: ChatConversationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack(spacing: 20) {
            // AsyncImage is needed if the image is loaded via URL from the internet
            Image(systemName: viewModel.data.chatPartner.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            
            VStack(alignment: .leading) {
                Text(viewModel.data.chatPartner.name)
                    .font(.title).bold()
                
                Text(viewModel.data.chatPartner.username)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}

#Preview {
    ChatTitleRow(viewModel: ChatConversationViewModel())
        .background(Color("CouchSurfingChatTitleRow"))
}
