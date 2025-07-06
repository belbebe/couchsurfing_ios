//
//  BookingModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 02/12/2023.
//

import Foundation
import SwiftData

@Model
class BookingModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case start_date = "startDate"
        case end_date = "endDate"
        case payment_method = "paymentMethod"
        case num_of_guests = "numOfGuests"
        case additional_notes = "additionalNotes"
        case is_pay_with_chores = "payWithChores"
        case total_price = "totalPrice"
        case currency
        case room_id = "roomId"
    }
    
    var id: Int
    var start_date: Date
    var end_date: Date
    var payment_method: PaymentMethod
    var num_of_guests: Int
    var additional_notes: String?
    var is_pay_with_chores: Bool
    var total_price: Float
    var currency: Currency
    var room_id: Int
    
    init(id: Int, start_date: Date, end_date: Date, payment_method: PaymentMethod, num_of_guests: Int, additional_notes: String? = nil, is_pay_with_chores: Bool, total_price: Float, currency: Currency, room_id: Int) {
        self.id = id
        self.start_date = start_date
        self.end_date = end_date
        self.payment_method = payment_method
        self.num_of_guests = num_of_guests
        self.additional_notes = additional_notes
        self.is_pay_with_chores = is_pay_with_chores
        self.total_price = total_price
        self.currency = currency
        self.room_id = room_id
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int.self, forKey: .id)
        self.start_date = try values.decode(Date.self, forKey: .start_date)
        self.end_date = try values.decode(Date.self, forKey: .end_date)
        self.payment_method = try values.decode(PaymentMethod.self, forKey: .payment_method)
        self.num_of_guests = try values.decode(Int.self, forKey: .num_of_guests)
        self.additional_notes = try values.decode(String.self, forKey: .additional_notes)
        self.is_pay_with_chores = try values.decode(Bool.self, forKey: .is_pay_with_chores)
        self.total_price = try values.decode(Float.self, forKey: .total_price)
        self.currency = try values.decode(Currency.self, forKey: .currency)
        self.room_id = try values.decode(Int.self, forKey: .room_id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(start_date, forKey: .start_date)
        try container.encode(end_date, forKey: .end_date)
        try container.encode(payment_method, forKey: .payment_method)
        try container.encode(num_of_guests, forKey: .num_of_guests)
        try container.encode(additional_notes, forKey: .additional_notes)
        try container.encode(is_pay_with_chores, forKey: .is_pay_with_chores)
        try container.encode(total_price, forKey: .total_price)
        try container.encode(currency, forKey: .currency)
        try container.encode(room_id, forKey: .room_id)
    }
}
