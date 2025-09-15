//
//  AccommListItemView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 05. 03..
//

import SwiftUI

struct AccommListItemView: View {
    let accommodation: Accommodation
    let other_needs_text: String = "Egyéb: "
    /*
    let image: String
    let type: String
    let address: String
    let rating: String
    let other_needs: [OtherNeed]
    let price: String
    
    init(image: String, type: String, address: String, rating: Double, others: [OtherNeed], price: Int) {
        self.image = image
        self.type = type
        self.address = "Cím: \(address)"
        self.rating = "Értékelés: \(rating)"
        self.other_needs = others
        self.price = "Ár: \(price) HUF/éj"
    }
     */
    
    private func process_other_needs(other: [OtherNeed]) -> String {
        var ret = ""
        for element in other {
            ret = ret + " \(element.name)"
        }
        
        return ret
    }
    
    private func process_accom_type(type: AccomTypeEnum) -> String {
        switch type {
        case .apartment:
            return "Apartman"
        case .room:
            return "Szoba"
        case .couch:
            return "Kanapé"
        }
    }
    
    private func process_price_per_night(price: Float) -> String {
        return "\(price) HUF"
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            if let image = accommodation.roomImages.first {
                Image(systemName: image.image)
                    .resizable()
                    .scaledToFit()
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(process_accom_type(type: accommodation.roomType))
                    .font(Font.body.weight(.bold))
                
                Text(accommodation.address)
                    .font(.body)
                /*
                Text(accommodation.rating)
                    .font(.body)
                */
                
                Text(other_needs_text + process_other_needs(other: accommodation.otherNeeds))
                    .font(.body)
            }
            
            Text(process_price_per_night(price: accommodation.price))
                .font(Font.body.weight(.bold))
        }
        .padding(5)
    }
}

struct AccommListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AccommListItemView(
            accommodation: Accommodation(
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
            )
        )
    }
}
