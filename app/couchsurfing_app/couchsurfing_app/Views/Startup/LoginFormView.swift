//
//  LoginFormView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 03. 27..
//

import SwiftUI

struct LoginFormView: View {
    private let username_email_placeholder = "Felhasználónév/email"
    private let password_placeholder = "Jelszó"
    private let login_btn_text = "Bejelentkezés"
    private let forgotten_pw_btn_text = "Elfelejtettem a jelszavam..."
    private let empty_username_dialog_text = "Kérlek, adj meg egy felhasználónevet vagy email-címet!"
    private let empty_password_dialog_text = "Kérlek, add meg a jelszavad!"
    private let wrong_pw_dialog_text = "A megadott jelszó helytelen. Kérlek, próbáld meg ismét!"

    @State private var empty_username_dialog_state = false
    @State private var empty_pw_dialog_state = false
    @State private var wrong_pw_dialog_state = false
    @FocusState private var textfiled_is_focused_state: Bool
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Form {
            // input text fields
            Section {
                // username or email
                TextField(username_email_placeholder, text: $viewModel.data.usernameOrEmail)
                    .focused($textfiled_is_focused_state)
                
                // password
                SecureField(password_placeholder, text: $viewModel.data.password, prompt: Text(password_placeholder))
                    .focused($textfiled_is_focused_state)
            }
            
            // buttons
            Section {
                // login
                Button(action: {() in
                    wrong_pw_dialog_state = (viewModel.data.password != "" && viewModel.data.password != viewModel.data.currentPassword)
                    
                    empty_username_dialog_state = viewModel.data.usernameOrEmail == ""
                    
                    empty_pw_dialog_state = viewModel.data.password == ""
                    
                    if(!wrong_pw_dialog_state && !empty_username_dialog_state && !empty_pw_dialog_state) {
                        // TODO: login after BE integration
                    }
                }) {
                    Text(login_btn_text)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.black)
                .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                .alert(empty_username_dialog_text, isPresented: $empty_username_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
                .alert(empty_password_dialog_text, isPresented: $empty_pw_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
                .alert(wrong_pw_dialog_text, isPresented: $wrong_pw_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
            }
            
            Section {
                // forgotten password
                Button(action: {() in
                    empty_username_dialog_state = viewModel.data.usernameOrEmail == ""
                    
                    if(!empty_username_dialog_state) {
                        // elfelejtett jelszó funkció megvalósítás
                    }
                }) {
                    Text(forgotten_pw_btn_text)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(CouchSurfingCustomColor.baseColor)
                .alert(empty_username_dialog_text, isPresented: $empty_username_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
            }
        }
    }
}

struct LoginFormView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFormView(viewModel: LoginViewModel())
    }
}
