//
//  SettingsProfileFormView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 10. 04..
//

import SwiftUI

struct SettingsProfileFormView: View {
    
    private let nav_title = "Adatok módosítása"
    private let name_placeholder = "Név"
    private let username_placeholder = "Felhasználónév"
    private let email_placeholder = "Email"
    private let phone_placeholder = "Telefon"
    private let modify_text = "Módosítás"
    private let modify_profile_picture = "Profilkép módosítása"
    
    @FocusState var textfield_is_focused: Bool
//    @State private var showSheet = false
    @StateObject private var viewModel = SettingsProfileFormViewModel(
        data: SettingsProfileFormViewModel.Data(user: User(
            name: "Minta Béla",
            username: "minta_bela_user",
            birthDate: "1980.01.01",
            email: "minta.bela@valami.hu",
            phoneNumber: "55512333")
        )
    )
    
    var body: some View {
        // profile picture
        Image(uiImage: viewModel.data.image)
            .resizable()
            .frame(width: 130, height: 130, alignment: .center)
            .padding(.top, 20)
            .padding(.bottom, 20)
        
        Form {
            // text data
            Section {
                // name
                TextField(name_placeholder, text: $viewModel.data.name)
                    .focused($textfield_is_focused)
                
                // username
                TextField(username_placeholder, text: $viewModel.data.username)
                    .focused($textfield_is_focused)
                
                // email address
                TextField(email_placeholder, text: $viewModel.data.email)
                    .focused($textfield_is_focused)
                
                // phone
                TextField(phone_placeholder, text: $viewModel.data.phone)
                    .keyboardType(.decimalPad)
                    .focused($textfield_is_focused)
            }
            
            // profile pic modification
            Section {
                VStack {
                    Button(action: {}) {
                        Text(modify_profile_picture)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                    .onTapGesture {
                        viewModel.data.isBottomsheetShown = true
                    }
                    
                    Button(action: {}) {
                        Text(modify_text)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                }
            }
            .listRowBackground(Color.clear)
            
            // modify button
            Section {

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
        .sheet(isPresented: $viewModel.data.isBottomsheetShown) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$viewModel.data.image)
        }
    }
}

struct SettingsProfileFormView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsProfileFormView()
    }
}
