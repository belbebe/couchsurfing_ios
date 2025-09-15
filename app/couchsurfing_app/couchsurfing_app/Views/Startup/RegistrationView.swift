//
//  RegistrationView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 03..
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.colorScheme) private var colorScheme
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                LogoComponent()
                
                if #available(iOS 16.0, *) {
                    RegistrationFormView(viewModel: viewModel)
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                } else if(colorScheme == .dark) {
                    RegistrationFormView(viewModel: viewModel)
                        .background(Color.black)
                        .modifier(DisableScrolling(disabled: true))
                } else {
                    RegistrationFormView(viewModel: viewModel)
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
