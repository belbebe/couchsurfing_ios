//
//  AccommodationRequest.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 03/12/2023.
//

import Foundation

class AccommodationRequest: Codable {
    var city: String
    var startDate: Date
    var endDate: Date
    var paymentMethod: [PaymentMethod]
    var priceFrom: Int?
    var priceTo: Int?
    var currency: Currency?
    var ratingFrom: Float?
    var ratingTo: Float?
    var nonSmoking: Bool
    var petFriendly: Bool
    var airConditioner: Bool
    var parking: Bool
    var bicycleStorage: Bool
    var tenantId: Int
    
    init(city: String, startDate: Date, endDate: Date, paymentMethod: [PaymentMethod], priceFrom: Int? = nil, priceTo: Int? = nil, currency: Currency? = nil, ratingFrom: Float? = nil, ratingTo: Float? = nil, nonSmoking: Bool, petFriendly: Bool, airConditioner: Bool, parking: Bool, bicycleStorage: Bool, tenantId: Int) {
        self.city = city
        self.startDate = startDate
        self.endDate = endDate
        self.paymentMethod = paymentMethod
        self.priceFrom = priceFrom
        self.priceTo = priceTo
        self.currency = currency
        self.ratingFrom = ratingFrom
        self.ratingTo = ratingTo
        self.nonSmoking = nonSmoking
        self.petFriendly = petFriendly
        self.airConditioner = airConditioner
        self.parking = parking
        self.bicycleStorage = bicycleStorage
        self.tenantId = tenantId
    }
}
