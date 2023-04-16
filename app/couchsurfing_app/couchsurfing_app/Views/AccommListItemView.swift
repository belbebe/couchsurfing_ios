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
            Image(systemName: accommodation.image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(process_accom_type(type: accommodation.type))
                    .font(Font.body.weight(.bold))
                
                Text(accommodation.address)
                    .font(.body)
                /*
                Text(accommodation.rating)
                    .font(.body)
                */
                
                Text(other_needs_text + process_other_needs(other: accommodation.other_needs))
                    .font(.body)
            }
            
            Text(process_price_per_night(price: accommodation.price_per_night))
                .font(Font.body.weight(.bold))
        }
        .padding(5)
    }
}

struct AccommListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AccommListItemView(accommodation: Accommodation(id: 1, user_id: 1, address: "Fő utca 1., Budapest", geo_long: 1.1, geo_lat: 1.1, type: .apartment, max_geust_num: 2, other_needs: [
            OtherNeed(name: "Nem-dohányzó"),
            OtherNeed(name: "Állatbarát")
        ], additional_info: "Info placeholder", price_per_night: 10000, image: "house.circle.fill"))
    }
}
