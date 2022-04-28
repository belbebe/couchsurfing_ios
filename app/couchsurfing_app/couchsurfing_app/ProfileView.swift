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
    private var sample_name: String = "Minta Béla"
    private var username_text: String = "Felhasználói név"
    private var sample_username: String = "minta_bela_user"
    private var date_of_birth: String = "Születési dátum"
    private var sample_birth_date: String = "1980. 01. 01."
    private var email_text: String = "Email"
    private var sample_email: String = "minta_bela@valami.hu"
    private var phone_text: String = "Telefon"
    private var sample_phone: String = "555-12-333"
    private var modify_data_button_text: String = "Adatok módosítása"
    private var modify_passw_button_text: String = "Jelszó módosítása"
    private var sign_out_text: String = "Kijelentkezés"
    
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
                    
                    Spacer(minLength: 110)
                        //.frame(height: 150)
                    
                    // gombok elhelyezése
                    Group {
                        Button(action: {}) {
                            Text(modify_data_button_text)
                        }
                            .padding(15)
                            .background(CouchSurfingCustomColor.buttonBackground)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                            .padding(3)
                            .background(CouchSurfingCustomColor.baseColor)
                            .cornerRadius(15)
                        
                        Spacer()
                            .frame(height: 15)
                        Button(action: {}) {
                            Text(modify_passw_button_text)
                        }
                            .padding(15)
                            .background(CouchSurfingCustomColor.buttonBackground)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                            .padding(3)
                            .background(CouchSurfingCustomColor.baseColor)
                            .cornerRadius(15)
                        
                        Spacer()
                            .frame(height: 15)
                        Button(action: {}) {
                            Text(sign_out_text)
                        }
                            .padding(15)
                            .background(CouchSurfingCustomColor.signOutColor)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                            .padding(3)
                            .background(.red)
                            .cornerRadius(15)
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
