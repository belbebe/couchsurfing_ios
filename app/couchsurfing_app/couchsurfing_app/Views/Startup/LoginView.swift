//
//  LoginView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 03. 19..
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                LogoComponent()
                
                if #available(iOS 16.0, *) {
                    LoginFormView(viewModel: viewModel)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                } else if(colorScheme == .dark) {
                    LoginFormView(viewModel: viewModel)
                        .background(Color.black)
                        .modifier(DisableScrolling(disabled: true))
                } else {
                    LoginFormView(viewModel: viewModel)
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
