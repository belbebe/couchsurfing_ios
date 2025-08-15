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
        let imageAssetName: String = "Couchsurfing app - Logo"
        let imageLabel: String = "Logo"
    }
}
