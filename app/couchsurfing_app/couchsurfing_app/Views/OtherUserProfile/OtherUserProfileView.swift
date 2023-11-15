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
    private var sample_name: String = "Minta Béla"
    private var username_text: String = "Felhasználói név"
    private var sample_username: String = "minta_bela_user"
    private var date_of_birth: String = "Születési dátum"
    private var sample_birth_date: String = "1980. 01. 01."
    private var email_text: String = "Email"
    private var sample_email: String = "minta_bela@valami.hu"
    private var phone_text: String = "Telefon"
    private var sample_phone: String = "555-12-333"
    private var start_chat_text: String = "Csevegés indítása"
    
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
                                Text(sample_name)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(username_text)
                                    .font(.body)
                                Text(sample_username)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(date_of_birth)
                                    .font(.body)
                                Text(sample_birth_date)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(email_text)
                                    .font(.body)
                                Text(sample_email)
                                    .font(Font.body.weight(.bold))
                            }
                            
                            VStack(alignment: .leading) {
                                Text(phone_text)
                                    .font(.body)
                                Text(sample_phone)
                                    .font(Font.body.weight(.bold))
                            }
                        }
                        
                        Image(systemName: "person.circle.fill")
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
            .navigationTitle("\(sample_name) \(nav_title)")
        }
    }
}

#Preview {
    OtherUserProfileView()
}
