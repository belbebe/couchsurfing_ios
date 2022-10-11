//
//  SettingsPasswordViewForm.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 10. 11..
//

import SwiftUI

struct SettingsPasswordViewForm: View {
    
    private let nav_title = "Jelszó módosítása"
    private let old_pw_placeholder = "Régi jelszó"
    private let new_pw_placeholder = "Új jelszó"
    private let new_pw_confirm_placeholder = "Új jelszó megerősítése"
    private let modify_text = "Módosítás"
    private let new_pw_not_match_text = "A megadott új jelszó és a megerősítés nem egyezik!"
    private let new_pw_empty_text = "Nem adott meg új jelszót!"
    private let old_pw_not_matching_text = "Helytelenül adta meg régi jelszavát!"
    
    private let old_pw_example = "example"
    
    @State var old_pw_state = ""
    @State var new_pw_state = ""
    @State var new_pw_confirm_state = ""
    @State var new_pw_not_matching_dialog_state = false
    @State var new_pw_empty_dialog_state = false
    @State var old_pw_not_matching_dialog_state = false
    @FocusState var textfield_is_focused: Bool
    
    var body: some View {
        Form {
            // input text fields
            Section {
                // old password
                SecureField(old_pw_placeholder, text: $old_pw_state, prompt: Text(old_pw_placeholder))
                    .focused($textfield_is_focused)
                    
                
                // new password
                SecureField(new_pw_placeholder, text: $new_pw_state, prompt: Text(new_pw_placeholder))
                    .focused($textfield_is_focused)
                
                // new password confirmation
                SecureField(new_pw_confirm_placeholder, text: $new_pw_confirm_state, prompt: Text(new_pw_placeholder))
                    .focused($textfield_is_focused)
            }
            
            // modify button
            Section {
                Button(action: {() in
                    new_pw_not_matching_dialog_state = (new_pw_state != "" && new_pw_state != new_pw_confirm_state)
                    
                    new_pw_empty_dialog_state = new_pw_state == ""
                    
                    old_pw_not_matching_dialog_state = old_pw_state != old_pw_example
                    
                    if(!new_pw_not_matching_dialog_state && !new_pw_empty_dialog_state && !old_pw_not_matching_dialog_state) {
                        // módosítás funkció megvalósítás
                    }
                }) {
                    Text(modify_text)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.black)
                .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                .alert(new_pw_not_match_text, isPresented: $new_pw_not_matching_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
                .alert(new_pw_empty_text, isPresented: $new_pw_empty_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
                .alert(old_pw_not_matching_text, isPresented: $old_pw_not_matching_dialog_state) {
                    Button("OK", role: .cancel) {}
                }
            }
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

struct SettingsPasswordViewForm_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPasswordViewForm()
    }
}
