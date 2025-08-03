//
//  SettingsPasswordFormView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 10. 11..
//

import SwiftUI

struct SettingsPasswordFormView: View {
    
    private let nav_title = "Jelszó módosítása"
    private let old_pw_placeholder = "Régi jelszó"
    private let new_pw_placeholder = "Új jelszó"
    private let new_pw_confirm_placeholder = "Új jelszó megerősítése"
    private let modify_text = "Módosítás"
    private let new_pw_not_match_text = "A megadott új jelszó és a megerősítés nem egyezik!"
    private let new_pw_empty_text = "Nem adott meg új jelszót!"
    private let old_pw_empty_text = "Nem adta meg a régi jelszót!"
    private let old_pw_not_matching_text = "Helytelenül adta meg régi jelszavát!"
    
    // TODO: fix dialog showing (e.g. on confirmation screen tooltip tap)
    
    @FocusState var textfield_is_focused: Bool
    @StateObject var viewModel = SettingsPasswordFormViewModel(data: .init(oldPassword: "example"))
    
    var body: some View {
        Form {
            // input text fields
            Section {
                // old password
                SecureField(old_pw_placeholder, text: $viewModel.data.oldPasswordValue, prompt: Text(old_pw_placeholder))
                    .focused($textfield_is_focused)
                    
                
                // new password
                SecureField(new_pw_placeholder, text: $viewModel.data.newPasswordValue, prompt: Text(new_pw_placeholder))
                    .focused($textfield_is_focused)
                
                // new password confirmation
                SecureField(new_pw_confirm_placeholder, text: $viewModel.data.newPasswordConfirmationValue, prompt: Text(new_pw_confirm_placeholder))
                    .focused($textfield_is_focused)
                // TODO: copy-paste disabled??? if not -> disable it!
            }
            
            // modify button
            Section {
                Button(action: { 
                    viewModel.modifyPasswordButtonTapListener()
                }) {
                    Text(modify_text)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                .alert(new_pw_not_match_text, isPresented: $viewModel.data.isNewPasswordNotMatchingDialogShown) {
                    Button("OK", role: .cancel) {}
                }
                .alert(new_pw_empty_text, isPresented: $viewModel.data.isNewPasswordEmptyDialogShown) {
                    Button("OK", role: .cancel) {}
                }
                .alert(old_pw_empty_text, isPresented: $viewModel.data.isOldPasswordEmptyDialogShown) {
                    Button("OK", role: .cancel) {}
                }
                .alert(old_pw_not_matching_text, isPresented: $viewModel.data.isOldPasswordNotMatchingDialogShown) {
                    Button("OK", role: .cancel) {}
                }
            }
            .listRowBackground(Color.clear)
        }
        .navigationTitle(nav_title)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    textfield_is_focused = false
                }
            }
        }
    }
}

struct SettingsPasswordFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPasswordFormView()
    }
}
