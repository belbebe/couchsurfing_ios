//
//  UserModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 01/12/2023.
//

import Foundation
import SwiftData

@Model
class UserModel {
    var id: Int
    var full_name: String
    var username: String
    var birth_date: Date
    var email: String
    var phone: String
    var rooms: [RoomModel]
    var bookings: [BookingModel]
    
    init(id: Int, full_name: String, username: String, birth_date: Date, email: String, phone: String, rooms: [RoomModel], bookings: [BookingModel]) {
        self.id = id
        self.full_name = full_name
        self.username = username
        self.birth_date = birth_date
        self.email = email
        self.phone = phone
        self.rooms = rooms
        self.bookings = bookings
    }
}
