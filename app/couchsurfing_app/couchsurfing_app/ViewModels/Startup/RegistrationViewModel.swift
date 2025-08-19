//
//  RegistrationViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 19..
//

import Foundation
import SwiftUI

@MainActor
public class RegistrationViewModel: ObservableObject {
    @Published var data: Data = Data()
}

// MARK: - Data
extension RegistrationViewModel {
    public class Data {
        let minimumRequiredAge = Calendar.current.date(byAdding: .year, value: -13, to: Date())!
        var fullName: String = ""
        var username: String = ""
        var email: String = ""
        var birthDate = Date()
        var phone: String = ""
        var password: String = ""
        var passwordConfirmation: String = ""
    }
}
