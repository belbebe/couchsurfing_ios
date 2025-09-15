//
//  OtherUserProfileViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 06..
//

import Foundation
import SwiftUI

@MainActor
public class OtherUserProfileViewModel: ObservableObject {
    @Published var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

// MARK: - Data
extension OtherUserProfileViewModel {
    public class Data {
        let user: User
        
        init(user: User) {
            self.user = user
        }
    }
}
