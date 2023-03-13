//
//  OtherNeed.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 20..
//

import Foundation

struct OtherNeed: Identifiable, Hashable {
    var name: String
    var id = UUID()
    var is_selected = false
}
