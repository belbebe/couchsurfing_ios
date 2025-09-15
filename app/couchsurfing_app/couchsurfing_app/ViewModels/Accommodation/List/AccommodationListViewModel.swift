//
//  AccommodationListViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 27..
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
public class AccommodationListViewModel: ObservableObject {
    @Published var data = Data()
}

// MARK: - Data
extension AccommodationListViewModel {
    public class Data {
        var currentCarouselIndex: Int = 0
        var isTooltipAlertShown = false
        // TODO: add Room object that is received from the list View
        // TODO: remove the following dummy data after connecting the view with the list view
        var address: String = "Budapest, Fő utca 1."
        var geoLength: Float = 19.046716
        var geoWidth: Float = 47.500952
        var roomType: AccomTypeEnum = AccomTypeEnum.room
        var price: Float = 10000.0
        var priceWithChores: Float = 7500.0
        var currency: Currency = .HUF
        var acceptedPaymentMethods: [PaymentMethod] = [.CASH, .CARD]
        var isPayingWithChoresAccepted: Bool = true
        var maxGuestNum: Int = 3
        var isNonSmoking: Bool = true
        var isPetFriendly: Bool = true
        var isAirConditioned: Bool = true
        var isParkingAvailable: Bool = false
        var isBicycleStorageAvailable: Bool = true
        var additionalInfo: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        var roomImages: [AccommodationImage] = [AccommodationImage(image: "living_room"), AccommodationImage(image: "living_room2"), AccommodationImage(image: "bedroom")]
    }
}
