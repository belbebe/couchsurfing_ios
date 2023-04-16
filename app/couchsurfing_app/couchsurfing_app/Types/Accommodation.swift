//
//  Accommodation.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 17..
//

import Foundation

struct Accommodation: Hashable, Identifiable {
    var id: Int
    var user_id: Int
    var address: String
    var geo_long: Float
    var geo_lat: Float
    var type: AccomTypeEnum
    var max_geust_num: Int
    var other_needs: [OtherNeed]
    var additional_info: String
    var price_per_night: Float
    var image: String
}
