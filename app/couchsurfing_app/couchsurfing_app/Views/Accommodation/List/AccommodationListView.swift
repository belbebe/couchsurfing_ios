//
//  AccommodationListView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 16..
//

import SwiftUI

struct AccommodationListView: View {
    private let nav_title = "Kanapék"
    
    // példa adatok  - backend bekötés után a backendről jönnek majd
    private var results = [
        Accommodation(
            id: 0,
            user_id: 1,
            address: "Budapest, Fő utca 1.",
            geoLength: 1.1,
            geoWidth: 1.1,
            roomType: .apartment,
            maxGuestNum: 2,
            otherNeeds: [
                OtherNeed(name: "Állatbarát"),
                OtherNeed(name: "Nem-dohányzó"),
                OtherNeed(name: "Légkondícionált"),
                OtherNeed(name: "Biciklitároló")
            ],
            additionalInfo: "",
            price: 5000,
            priceWithChores: 2500,
            currency: .HUF,
            acceptedPaymentMethods: [.CHORE, .CASH, .CARD],
            isPayingWithChoresAccepted: true,
            isNonSmoking: true,
            isPetFriendly: true,
            isAirConditioned: true,
            isParkingAvailable: false,
            isBicycleStorageAvailable: true,
            roomImages: [.init(image: "house.circle.fill")]
        ),
        Accommodation(
            id: 1,
            user_id: 1,
            address: "Budapest, Fő utca 1/b.",
            geoLength: 1.1,
            geoWidth: 1.1,
            roomType: .room,
            maxGuestNum: 3,
            otherNeeds: [
                OtherNeed(name: "Állatbarát"),
                OtherNeed(name: "Nem-dohányzó")
            ],
            additionalInfo: "",
            price: 5000,
            currency: .HUF,
            acceptedPaymentMethods: [.CASH, .CARD],
            isPayingWithChoresAccepted: false,
            isNonSmoking: true,
            isPetFriendly: true,
            isAirConditioned: false,
            isParkingAvailable: false,
            isBicycleStorageAvailable: false,
            roomImages: [.init(image: "house.circle.fill")]
        ),
        Accommodation(
            id: 2,
            user_id: 2,
            address: "Budapest, Külső Szilágyi út 1.",
            geoLength: 1.1,
            geoWidth: 27.5,
            roomType: .couch,
            maxGuestNum: 1,
            otherNeeds: [
                OtherNeed(name: "Állatbarát"),
                OtherNeed(name: "Parkolási lehetőség")
            ],
            additionalInfo: "",
            price: 5000,
            currency: .HUF,
            acceptedPaymentMethods: [.CASH],
            isPayingWithChoresAccepted: false,
            isNonSmoking: false,
            isPetFriendly: true,
            isAirConditioned: false,
            isParkingAvailable: true,
            isBicycleStorageAvailable: false,
            roomImages: [.init(image: "house.circle.fill")]
        )
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<results.count) { index in
                    NavigationLink(destination: AccommodationDetailsView()) {
                        AccommListItemView(accommodation: results[index])
                    }
                }
            }
            .navigationTitle(nav_title)
        }
    }
}

struct AccommodationListView_Previews: PreviewProvider {
    static var previews: some View {
        AccommodationListView()
    }
}
