//
//  SettingsProfileViewForm.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 10. 04..
//

import SwiftUI

struct SettingsProfileViewForm: View {
    
    private let nav_title = "Adatok módosítása"
    private let name_current = "Minta Béla" // placeholder helyett igazi érték lekérése majd
    private let name_placeholder = "Név"
    private let username_current = "minta_bela_user"
    private let username_placeholder = "Felhasználónév"
    private let email_current = "minta_bela@valami.hu"
    private let email_placeholder = "Email"
    private let phone_current = "55512333"
    private let phone_placeholder = "Telefon"
    private let modify_text = "Módosítás"
    private let modify_profile_picture = "Profilkép módosítása"
    
    @State var name_state = ""
    @State var username_state = ""
    @State var email_state = ""
    @State var phone_state = ""
    @FocusState var textfield_is_focused: Bool
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    init() {
        // fill the state variables with current data
        self._name_state = State(initialValue: name_current)
        self._username_state = State(initialValue: username_current)
        self._email_state = State(initialValue: email_current)
        self._phone_state = State(initialValue: phone_current)
    }
    
    var body: some View {
        // profile picture
        Image(uiImage: self.image)
            .resizable()
            .frame(width: 130, height: 130, alignment: .center)
            .padding(.top, 20)
            .padding(.bottom, 20)
        
        Form {
            // text data
            Section {
                // name
                TextField(name_placeholder, text: $name_state)
                    .focused($textfield_is_focused)
                
                // username
                TextField(username_placeholder, text: $username_state)
                    .focused($textfield_is_focused)
                
                // email address
                TextField(email_placeholder, text: $email_state)
                    .focused($textfield_is_focused)
                
                // phone
                TextField(phone_placeholder, text: $phone_state)
                    .keyboardType(.decimalPad)
                    .focused($textfield_is_focused)
            }
            
            // profile pic modification
            Section {
                Button(action: {}) {
                    Text(modify_profile_picture)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.black)
                .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                .onTapGesture {
                    showSheet = true
                }
            }
            
            // modify button
            Section {
                Button(action: {}) {
                    Text(modify_text)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .foregroundColor(.black)
                .listRowBackground(CouchSurfingCustomColor.buttonBackground)
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
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}

struct SettingsProfileViewForm_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileViewForm()
    }
}
