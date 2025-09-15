//
//  ChatConversationView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 10/10/2023.
//

import SwiftUI

struct ChatConversationView: View {
    @StateObject private var viewModel = ChatConversationViewModel()
    
    var body: some View {
        VStack {
            VStack {
                ChatTitleRow(viewModel: viewModel)
                    .background(Color("CouchSurfingChatTitleRow"))
                
                ScrollView {
                    ForEach(viewModel.data.messages, id: \.self) { message in
                        MessageBubble(message: message)
                    }
                }
                .padding(.top, 10)
            }
            
            MessageField(viewModel: viewModel)
        }
    }
}

#Preview {
    ChatConversationView()
}
