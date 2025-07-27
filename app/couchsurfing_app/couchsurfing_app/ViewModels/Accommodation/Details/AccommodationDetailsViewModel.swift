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
        let latitude: CLLocationDegrees = Double(self.data.geoWidth)
        let longitude: CLLocationDegrees = Double(self.data.geoLength)
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
    public class Data: ObservableObject {
        @State var currentCarouselIndex: Int = 0
        @State var isTooltipAlertShown = false
        // TODO: add Room object that is received from the list View
        // TODO: remove the following dummy data after connecting the view with the list view
        @State var address: String = "Budapest, Fő utca 1."
        @State var geoLength: Float = 19.046716
        @State var geoWidth: Float = 47.500952
        @State var roomType: AccomTypeEnum = AccomTypeEnum.room
        @State var price: Float = 10000.0
        @State var priceWithChores: Float = 7500.0
        @State var currency: Currency = .HUF
        @State var acceptedPaymentMethods: [PaymentMethod] = [.CASH, .CARD]
        @State var isPayingWithChoresAccepted: Bool = true
        @State var maxGuestNum: Int = 3
        @State var isNonSmoking: Bool = true
        @State var isPetFriendly: Bool = true
        @State var isAirConditioned: Bool = true
        @State var isParkingAvailable: Bool = false
        @State var isBicycleStorageAvailable: Bool = true
        @State var additionalInfo: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        @State var roomImages: [AccommImage] = [AccommImage(image: "living_room"), AccommImage(image: "living_room2"), AccommImage(image: "bedroom")]
    }
}
