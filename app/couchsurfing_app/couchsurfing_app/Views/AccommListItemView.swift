//
//  AccommListItemView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 05. 03..
//

import SwiftUI

struct AccommListItemView: View {
    let image: String
    let type: String
    let address: String
    let rating: String
    let other_needs: [OtherNeed]
    let other_needs_text: String = "Egyéb: "
    let price: String
    
    init(image: String, type: String, address: String, rating: Double, others: [OtherNeed], price: Int) {
        self.image = image
        self.type = type
        self.address = "Cím: \(address)"
        self.rating = "Értékelés: \(rating)"
        self.other_needs = others
        self.price = "Ár: \(price) HUF/éj"
    }
    
    private func process_other_needs(other: [OtherNeed]) -> String {
        var ret = ""
        for element in other {
            ret = ret + " \(element.name)"
        }
        
        return ret
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 10) {
                Text(type)
                    .font(Font.body.weight(.bold))
                
                Text(address)
                    .font(.body)
                
                Text(rating)
                    .font(.body)
                
                Text(other_needs_text + process_other_needs(other: other_needs))
                    .font(.body)
            }
            
            Text(price)
                .font(Font.body.weight(.bold))
        }
        .padding(10)
    }
}

struct AccommListItemView_Previews: PreviewProvider {
    static var previews: some View {
        AccommListItemView(image: "house.circle.fill", type: "Apartman", address: "Fő utca 1., Budapest", rating: 4.7, others: [
            OtherNeed(name: "Nem-dohányzó"),
            OtherNeed(name: "Állatbarát")
        ], price: 10000)
    }
}
