//
//  OtherUserProfileView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 14/11/2023.
//

import SwiftUI

struct OtherUserProfileView: View {
    private var nav_title: String = "profilja"
    private var name_text: String = "Név"
    private var username_text: String = "Felhasználói név"
    private var date_of_birth: String = "Születési dátum"
    private var email_text: String = "Email"
    private var sample_email: String = "minta_bela@valami.hu"
    private var phone_text: String = "Telefon"
    private var start_chat_text: String = "Csevegés indítása"
    
    @StateObject private var viewModel = OtherUserProfileViewModel(
        data: OtherUserProfileViewModel.Data(
            user: User(
                name: "Minta Géza",
                username: "minta_geza_user",
                birthDate: "1980. 01. 01.",
                email: "minta_geza@valami.hu",
                phoneNumber: "555-12-333",
                profilePicture: "person.circle.fill"
            )
        )
    )
    
    var body: some View {
        NavigationView {
            ScrollView {
                Spacer()
                    .frame(height: 15)
                VStack {
                    // személyes adatok és kép elhelyezése az adatok mellett
                    HStack(spacing: 30) {
                        VStack(alignment: .leading, spacing: 15) {
                            VStack(alignment: .leading) {
                                Text(name_text)
                                    .font(.body)
                                Text(viewModel.data.user.name)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(username_text)
                                    .font(.body)
                                Text(viewModel.data.user.username)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(date_of_birth)
                                    .font(.body)
                                Text(viewModel.data.user.birthDateString)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(email_text)
                                    .font(.body)
                                Text(viewModel.data.user.email)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(phone_text)
                                    .font(.body)
                                Text(viewModel.data.user.phoneNumber)
                                    .font(Font.body.weight(.bold))
                            }
                        }
                        
                        Image(systemName: viewModel.data.user.profilePicture)
                            .resizable()
                            .frame(width: 130, height: 130, alignment: .trailing)
                    }
                    
                    Spacer(minLength: 80)
                        //.frame(height: 150)
                    
                    // gombok elhelyezése
                    Group {
                        // Foglalás megtekintése
                        NavigationLink(destination: ChatConversationView()) {
                            Text(start_chat_text)
                                .multilineTextAlignment(.center)
                        }
                        .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                    }
                }
            }
            .navigationTitle("\(viewModel.data.user.name) \(nav_title)")
        }
    }
}

#Preview {
    OtherUserProfileView()
}
