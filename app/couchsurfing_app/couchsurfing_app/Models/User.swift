//
//  User.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 03..
//

import Foundation

public struct User {
    let name: String
    let username: String
    let birthDate: Date
    let email: String
    let phoneNumber: String
    // TODO: modify this to image asset
    let profilePicture: String
    
    init(
        name: String,
        username: String,
        birthDate: String,
        email: String,
        phoneNumber: String,
        profilePicture: String = "person.circle.fill"
    ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.name = name
        self.username = username
        self.birthDate = formatter.date(from: birthDate) ?? Date()
        self.email = email
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
    }
    
    init(
        name: String,
        username: String,
        birthDate: Date,
        email: String,
        phoneNumber: String,
        profilePicture: String = "person.circle.fill"
    ) {
        self.name = name
        self.username = username
        self.birthDate = birthDate
        self.email = email
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
    }
    
    var birthDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: birthDate)
    }
}
