//
//  ProfileView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 07..
//

import SwiftUI

struct ProfileView: View {
    
    private var nav_title: String = "Profil"
    private var name_text: String = "Név"
    private var username_text: String = "Felhasználói név"
    private var date_of_birth: String = "Születési dátum"
    private var email_text: String = "Email"
    private var phone_text: String = "Telefon"
    private var modify_data_button_text: String = "Adatok módosítása"
    private var modify_passw_button_text: String = "Jelszó módosítása"
    private var sign_out_text: String = "Kijelentkezés"
    private var view_rents_text: String = "Kiadások megtekintése"
    private var view_bookings_text: String = "Foglalások megtekintése"
    
    // TODO: remove dummy data and add user data from BE
    @StateObject private var viewModel = ProfileViewModel(
        data: .init(user: User(
            name: "Minta Béla",
            username: "minta_bela_user",
            birthDate: "1980-01-01",
            email: "minta_bela@valami.hu",
            phoneNumber: "555-12-333")
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
                        
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 130, height: 130, alignment: .trailing)
                    }
                    
                    Spacer(minLength: 80)
                        //.frame(height: 150)
                    
                    // gombok elhelyezése
                    Group {
                        HStack(spacing: 15) {
                            // Foglalás megtekintése
                            Button(action: {}) {
                                Text(view_bookings_text)
                                    .multilineTextAlignment(.center)
                            }
                            .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                            
                            // Kiadások megtekintése
                            Button(action: {}) {
                                Text(view_rents_text)
                                    .multilineTextAlignment(.center)
                            }
                                .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: 15)
                        
                        // Adatok módosítása
                        NavigationLink(destination: SettingsProfileFormView()) {
                            Text(modify_data_button_text)
                        }
                        .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                        
                        Spacer()
                            .frame(height: 15)
                        // Jelszó módosítása
                        NavigationLink(destination: SettingsPasswordFormView()) {
                            Text(modify_passw_button_text)
                        }
                            .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                        
                        Spacer()
                            .frame(height: 15)
                        // Kijelentkezés
                        Button(action: {}) {
                            Text(sign_out_text)
                        }
                            .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.signOutColor, background: .red))
                    }
                }
            }
            .navigationTitle(nav_title)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
