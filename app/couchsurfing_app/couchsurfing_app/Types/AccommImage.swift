//
//  AccommImage.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 25/10/2023.
//

import Foundation

struct AccommImage: Identifiable, Equatable {
    var id = UUID().uuidString
    var image: String
}
