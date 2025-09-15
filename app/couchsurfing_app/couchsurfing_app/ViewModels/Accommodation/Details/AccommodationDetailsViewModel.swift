//
//  AccommodationDetailsViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 27..
//

import Foundation
import MapKit
import SwiftData
import SwiftUI

@MainActor
public class AccommodationDetailsViewModel: ObservableObject {
    @Published var data = Data()
    
    func openLocationOnMap() {
        let latitude: CLLocationDegrees = Double(self.data.accommodation.geoWidth)
        let longitude: CLLocationDegrees = Double(self.data.accommodation.geoLength)
        let regionDistance: CLLocationDistance = 10000
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "Couch"
        mapItem.openInMaps(launchOptions: options)
    }
}

// MARK: - Data
extension AccommodationDetailsViewModel {
    // TODO: evaluate if this needs to be ObservableObject
    public class Data {
        var currentCarouselIndex: Int = 0
        var isTooltipAlertShown = false
        // TODO: remove the following dummy data after connecting the view with the list view
        var accommodation: Accommodation = Accommodation(
            id: 0,
            user_id: 0,
            address: "Budapest, Fő utca 1.",
            geoLength: 19.046716,
            geoWidth: 47.500952,
            roomType: .room,
            maxGuestNum: 3,
            otherNeeds: [
                OtherNeed(name: "Állatbarát"),
                OtherNeed(name: "Nem-dohányzó"),
                OtherNeed(name: "Légkondícionált"),
                OtherNeed(name: "Biciklitároló")
            ],
            additionalInfo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            price: 5000,
            priceWithChores: 2500,
            currency: .HUF,
            acceptedPaymentMethods: [
                .CASH,
                .CARD,
                .CHORE
            ],
            isPayingWithChoresAccepted: true,
            isNonSmoking: true,
            isPetFriendly: true,
            isAirConditioned: true,
            isParkingAvailable: false,
            isBicycleStorageAvailable: true,
            roomImages: [
                AccommodationImage(image: "living_room"),
                AccommodationImage(image: "living_room2"),
                AccommodationImage(image: "bedroom")
            ]
        )
//        var address: String = "Budapest, Fő utca 1."
//        var geoLength: Float = 19.046716
//        var geoWidth: Float = 47.500952
//        var roomType: AccomTypeEnum = AccomTypeEnum.room
//        var price: Float = 10000.0
//        var priceWithChores: Float = 7500.0
//        var currency: Currency = .HUF
//        var acceptedPaymentMethods: [PaymentMethod] = [.CASH, .CARD]
//        var isPayingWithChoresAccepted: Bool = true
//        var maxGuestNum: Int = 3
//        var isNonSmoking: Bool = true
//        var isPetFriendly: Bool = true
//        var isAirConditioned: Bool = true
//        var isParkingAvailable: Bool = false
//        var isBicycleStorageAvailable: Bool = true
//        var additionalInfo: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
//        var roomImages: [AccommodationImage] = [AccommodationImage(image: "living_room"), AccommodationImage(image: "living_room2"), AccommodationImage(image: "bedroom")]
    }
}
