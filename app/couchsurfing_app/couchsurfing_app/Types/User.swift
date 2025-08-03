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
    
    init(
        name: String,
        username: String,
        birthDate: String,
        email: String,
        phoneNumber: String
    ) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.name = name
        self.username = username
        self.birthDate = formatter.date(from: birthDate) ?? Date()
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    init(
        name: String,
        username: String,
        birthDate: Date,
        email: String,
        phoneNumber: String
    ) {
        self.name = name
        self.username = username
        self.birthDate = birthDate
        self.email = email
        self.phoneNumber = phoneNumber
    }
    
    var birthDateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: birthDate)
    }
}
