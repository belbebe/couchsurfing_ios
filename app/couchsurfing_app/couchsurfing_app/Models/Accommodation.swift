//
//  Accommodation.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 17..
//

import Foundation

struct Accommodation: Hashable, Identifiable, Equatable {
    var id: Int
    var user_id: Int
    var address: String
    var geoLength: Float
    var geoWidth: Float
    var roomType: AccomTypeEnum
    var maxGuestNum: Int
    var otherNeeds: [OtherNeed]
    var additionalInfo: String?
    var price: Float
    var priceWithChores: Float?
    var currency: Currency
    var acceptedPaymentMethods: [PaymentMethod]
    var isPayingWithChoresAccepted: Bool
    var isNonSmoking: Bool
    var isPetFriendly: Bool
    var isAirConditioned: Bool
    var isParkingAvailable: Bool
    var isBicycleStorageAvailable: Bool
//    var image: String
    var roomImages: [AccommodationImage]
}
