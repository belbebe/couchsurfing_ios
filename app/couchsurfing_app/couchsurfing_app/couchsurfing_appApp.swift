//
//  couchsurfing_appApp.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 03..
//

import SwiftData
import SwiftUI

@main
struct couchsurfing_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: UserModel.self)
        .modelContainer(for: RoomModel.self)
        .modelContainer(for: BookingModel.self)
        .modelContainer(for: LeaderboardModel.self)
    }
}
