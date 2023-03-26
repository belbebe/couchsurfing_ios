//
//  LoginView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 03. 19..
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Couchsurfing app - Logo", label: Text("Logo"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .top)
                
                if #available(iOS 16.0, *) {
                    LoginFormView()
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                } else if(colorScheme == .dark) {
                    LoginFormView()
                        .background(Color.black)
                        .modifier(DisableScrolling(disabled: true))
                } else {
                    LoginFormView()
                        .background(Color.white)
                        .modifier(DisableScrolling(disabled: true))
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
