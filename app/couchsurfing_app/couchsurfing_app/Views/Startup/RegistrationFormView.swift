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

    @FocusState private var textfield_is_focused_state: Bool
    @ObservedObject private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            Section {
                // full name
                TextField(full_name_placeholder, text: $viewModel.data.fullName)
                    .focused($textfield_is_focused_state)
                
                // username (optional)
                TextField(username_placeholder, text: $viewModel.data.username)
                    .focused($textfield_is_focused_state)
                
                // bith date
                DatePicker(birth_date_text, selection: $viewModel.data.birthDate, in: ...viewModel.data.minimumRequiredAge, displayedComponents: [.date])
                
                // email
                TextField(email_placeholder, text: $viewModel.data.email)
                    .focused($textfield_is_focused_state)
                
                // phone
                TextField(phone_placeholder, text: $viewModel.data.phone)
                    .keyboardType(.decimalPad)
                    .focused($textfield_is_focused_state)
                
                // password
                SecureField(password_placeholder, text: $viewModel.data.password, prompt: Text(password_placeholder))
                    .focused($textfield_is_focused_state)
                
                // password confirm
                SecureField(password_confirm_placeholder, text: $viewModel.data.passwordConfirmation, prompt: Text(password_confirm_placeholder))
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
        RegistrationFormView(viewModel: RegistrationViewModel())
    }
}
