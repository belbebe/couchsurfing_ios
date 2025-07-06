//
//  RoomModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 02/12/2023.
//

import Foundation
import SwiftData

@Model
class RoomModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case address
        case geo_length = "geoLength"
        case geo_width = "geoWidth"
        case room_type = "roomType"
        case price
        case currency
        case is_paying_with_chores_possible = "payingWithChoresPossible"
        case price_with_chores = "priceWithChores"
        case is_paying_with_cash_possible = "payingWithCashPossible"
        case is_paying_with_card_possible = "payingWithCardPossible"
        case max_guest_num = "maxGuestNum"
        case is_non_smoking = "nonSmoking"
        case is_pet_friendly = "petFriendly"
        case is_air_coniditioner_available = "airConditioner"
        case is_parking_available = "parking"
        case is_bicycle_storage_available = "bicycleStorage"
        case additional_info = "additionalInfo"
        case owner_id = "ownerId"
        case bookings
    }
    
    var id: Int
    var address: String
    var geo_length: Float
    var geo_width: Float
    var room_type: RoomType
    var price: Float
    var currency: Currency
    var is_paying_with_chores_possible: Bool
    var price_with_chores: Float?
    var is_paying_with_cash_possible: Bool
    var is_paying_with_card_possible: Bool
    var max_guest_num: Int
    var is_non_smoking: Bool
    var is_pet_friendly: Bool
    var is_air_coniditioner_available: Bool
    var is_parking_available: Bool
    var is_bicycle_storage_available: Bool
    var additional_info: String?
    var owner_id: Int
    var bookings: [BookingModel]
    
    init(id: Int, address: String, geo_length: Float, geo_width: Float, room_type: RoomType,
         price: Float, currency: Currency, is_paying_with_chores_possible: Bool, price_with_chores: Float? = nil,
         is_paying_with_cash_possible: Bool, is_paying_with_card_possible: Bool, max_guest_num: Int,
         is_non_smoking: Bool, is_pet_friendly: Bool, is_air_coniditioner_available: Bool, is_parking_available: Bool,
         is_bicycle_storage_available: Bool, additional_info: String? = nil, owner_id: Int, bookings: [BookingModel]) {
        self.id = id
        self.address = address
        self.geo_length = geo_length
        self.geo_width = geo_width
        self.room_type = room_type
        self.price = price
        self.currency = currency
        self.is_paying_with_chores_possible = is_paying_with_chores_possible
        self.price_with_chores = price_with_chores
        self.is_paying_with_cash_possible = is_paying_with_cash_possible
        self.is_paying_with_card_possible = is_paying_with_card_possible
        self.max_guest_num = max_guest_num
        self.is_non_smoking = is_non_smoking
        self.is_pet_friendly = is_pet_friendly
        self.is_air_coniditioner_available = is_air_coniditioner_available
        self.is_parking_available = is_parking_available
        self.is_bicycle_storage_available = is_bicycle_storage_available
        self.additional_info = additional_info
        self.owner_id = owner_id
        self.bookings = bookings
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.address = try values.decode(String.self, forKey: .address)
        self.geo_length = try values.decode(Float.self, forKey: .geo_length)
        self.geo_width = try values.decode(Float.self, forKey: .geo_width)
        self.room_type = try values.decode(RoomType.self, forKey: .room_type)
        self.price = try values.decode(Float.self, forKey: .price)
        self.currency = try values.decode(Currency.self, forKey: .currency)
        self.is_paying_with_chores_possible = try values.decode(Bool.self, forKey: .is_paying_with_chores_possible)
        self.price_with_chores = try values.decode(Float.self, forKey: .price_with_chores)
        self.is_paying_with_cash_possible = try values.decode(Bool.self, forKey: .is_paying_with_cash_possible)
        self.is_paying_with_card_possible = try values.decode(Bool.self, forKey: .is_paying_with_card_possible)
        self.max_guest_num = try values.decode(Int.self, forKey: .max_guest_num)
        self.is_non_smoking = try values.decode(Bool.self, forKey: .is_non_smoking)
        self.is_pet_friendly = try values.decode(Bool.self, forKey: .is_pet_friendly)
        self.is_air_coniditioner_available = try values.decode(Bool.self, forKey: .is_air_coniditioner_available)
        self.is_parking_available = try values.decode(Bool.self, forKey: .is_parking_available)
        self.is_bicycle_storage_available = try values.decode(Bool.self, forKey: .is_bicycle_storage_available)
        self.additional_info = try values.decode(String.self, forKey: .additional_info)
        self.owner_id = try values.decode(Int.self, forKey: .owner_id)
        self.bookings = try values.decode([BookingModel].self, forKey: .bookings)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(address, forKey: .address)
        try container.encode(geo_length, forKey: .geo_length)
        try container.encode(geo_width, forKey: .geo_width)
        try container.encode(room_type, forKey: .room_type)
        try container.encode(price, forKey: .price)
        try container.encode(currency, forKey: .currency)
        try container.encode(is_paying_with_chores_possible, forKey: .is_paying_with_chores_possible)
        try container.encode(price_with_chores, forKey: .price_with_chores)
        try container.encode(is_paying_with_cash_possible, forKey: .is_paying_with_cash_possible)
        try container.encode(is_paying_with_card_possible, forKey: .is_paying_with_card_possible)
        try container.encode(max_guest_num, forKey: .max_guest_num)
        try container.encode(is_non_smoking, forKey: .is_non_smoking)
        try container.encode(is_pet_friendly, forKey: .is_pet_friendly)
        try container.encode(is_air_coniditioner_available, forKey: .is_air_coniditioner_available)
        try container.encode(is_parking_available, forKey: .is_parking_available)
        try container.encode(is_bicycle_storage_available, forKey: .is_bicycle_storage_available)
        try container.encode(additional_info, forKey: .additional_info)
        try container.encode(owner_id, forKey: .owner_id)
        try container.encode(bookings, forKey: .bookings)
    }
}
