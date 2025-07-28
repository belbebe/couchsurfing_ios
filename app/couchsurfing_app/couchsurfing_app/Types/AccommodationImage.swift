//
//  AccommodationImage.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 25/10/2023.
//

import Foundation

struct AccommodationImage: Identifiable, Equatable, Hashable {
    var id = UUID().uuidString
    var image: String
}
