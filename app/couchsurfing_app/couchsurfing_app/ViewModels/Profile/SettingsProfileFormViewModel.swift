//
//  SettingsProfileFormViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 04..
//

import Foundation
import SwiftUI

@MainActor
public class SettingsProfileFormViewModel: ObservableObject {
    @Published var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

// MARK: - Data
extension SettingsProfileFormViewModel {
    public class Data {
        let user: User
        var name: String
        var username: String
        var email: String
        var phone: String
        var image: UIImage
        // TODO: check if this works properly!
        var isBottomsheetShown: Bool = false
        
        init(user: User) {
            self.user = user
            self.name = user.name
            self.username = user.username
            self.email = user.email
            self.phone = user.phoneNumber
            self.image = .init(systemName: user.profilePicture) ?? UIImage()
        }
    }
}
