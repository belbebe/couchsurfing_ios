//
//  LeaderboardViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 01..
//

import Foundation
import SwiftUI

@MainActor
public class LeaderboardViewModel: ObservableObject {
    @Published var data: Data
    
    init(data: Data) {
        self.data = data
    }
}

// MARK: - Data
extension LeaderboardViewModel {
    public class Data {
        var renters: [UserLeaderboardInfo]
        var owners: [UserLeaderboardInfo]
        var pickerState: String
        
        init(
            renters: [UserLeaderboardInfo],
            owners: [UserLeaderboardInfo],
            pickerState:String  = LeaderboardPickerView.Options.renters.rawValue
        ) {
            self.renters = renters
            self.owners = owners
            self.pickerState = pickerState
        }
    }
}
