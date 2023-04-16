//
//  StartupView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 03..
//

import SwiftUI

struct StartupView: View {
    private let login_btn_text = "Bejelentkezés"
    private let registration_btn_text = "Regisztráció"
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Couchsurfing app - Logo", label: Text("Logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .top)
                
                // log in
                NavigationLink(destination: LoginView()) {
                    Text(login_btn_text)
                }
                .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                
                // sign up
                NavigationLink(destination: RegistrationView()) {
                    Text(registration_btn_text)
                }
                .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.baseColor, background: CouchSurfingCustomColor.baseColor))
            }
        }
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
