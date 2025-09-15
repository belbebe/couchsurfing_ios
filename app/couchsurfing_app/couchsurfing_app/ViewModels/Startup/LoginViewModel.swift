//
//  LoginViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 15..
//

import Foundation
import SwiftUI

@MainActor
public class LoginViewModel: ObservableObject {
    @Published var data: Data = Data()
}

// MARK: - Data
extension LoginViewModel {
    public class Data {
        var usernameOrEmail: String = ""
        var password: String = ""
        // TODO: remove this after BE integration
        let currentPassword: String = "example" // current pw to test the feature
    }
}
