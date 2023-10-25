//
//  RegistrationView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 03..
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Couchsurfing app - Logo", label: Text("Logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .top)
                
                if #available(iOS 16.0, *) {
                    RegistrationFormView()
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                } else if(colorScheme == .dark) {
                    RegistrationFormView()
                        .background(Color.black)
                        .modifier(DisableScrolling(disabled: true))
                } else {
                    RegistrationFormView()
                        .background(Color.white)
                        .modifier(DisableScrolling(disabled: true))
                }
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
