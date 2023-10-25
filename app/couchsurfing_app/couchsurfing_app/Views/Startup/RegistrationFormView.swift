//
//  RegistrationFormView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 03..
//

import SwiftUI

struct RegistrationFormView: View {
    private let full_name_placeholder = "Teljes név"
    private let username_placeholder = "Felhasználónév (opcionális)"
    private let birth_date_text = "Születési dátum"
    private let email_placeholder = "Email"
    private let phone_placeholder = "Telefon"
    private let password_placeholder = "Jelszó"
    private let password_confirm_placeholder = "Jelszó megerősítése"
    private let registration_btn_text = "Regisztráció"
    
    private var minimum_age = Calendar.current.date(byAdding: .year, value: -13, to: Date())!
    @State private var full_name_state = ""
    @State private var username_state = ""
    @State private var birth_date = Date()
    @State private var email_state = ""
    @State private var phone_state = ""
    @State private var password_state = ""
    @State private var password_confirm_state = ""
    @FocusState private var textfield_is_focused_state: Bool
    
    var body: some View {
        Form {
            Section {
                // full name
                TextField(full_name_placeholder, text: $full_name_state)
                    .focused($textfield_is_focused_state)
                
                // username (optional)
                TextField(username_placeholder, text: $username_state)
                    .focused($textfield_is_focused_state)
                
                // bith date
                DatePicker(birth_date_text, selection: $birth_date, in: ...minimum_age, displayedComponents: [.date])
                
                // email
                TextField(email_placeholder, text: $email_state)
                    .focused($textfield_is_focused_state)
                
                // phone
                TextField(phone_placeholder, text: $phone_state)
                    .keyboardType(.decimalPad)
                    .focused($textfield_is_focused_state)
                
                // password
                SecureField(password_placeholder, text: $password_state, prompt: Text(password_placeholder))
                    .focused($textfield_is_focused_state)
                
                // password confirm
                SecureField(password_confirm_placeholder, text: $password_confirm_state, prompt: Text(password_confirm_placeholder))
                    .focused($textfield_is_focused_state)
            }
            
            Section {
                // registration
                Button(action: {() in
                    // mező kitöltések ellenőrzése
                    // regisztráció funkció megvalósítás
                }) {
                    Text(registration_btn_text)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.black)
                .listRowBackground(CouchSurfingCustomColor.buttonBackground)
            }
        }
    }
}

struct RegistrationFormView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationFormView()
    }
}
