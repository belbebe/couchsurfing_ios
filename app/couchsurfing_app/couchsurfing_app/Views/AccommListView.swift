//
//  AccomListView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2023. 04. 16..
//

import SwiftUI

struct AccommListView: View {
    private let nav_title = "Kanapék"
    
    // példa adatok  - backend bekötés után a backendről jönnek majd
    private var results = [
        Accommodation(id: 0, user_id: 1, address: "Budapest, Fő utca 1.", geo_long: 1.1, geo_lat: 1.1, type: .apartment, max_geust_num: 2, other_needs: [OtherNeed(name: "Állatbarát"), OtherNeed(name: "Nem-dohányzó")], additional_info: "", price_per_night: 5000, image: "house.circle.fill"),
        Accommodation(id: 1, user_id: 1, address: "Budapest, Fő utca 1/b.", geo_long: 1.1, geo_lat: 1.1, type: .apartment, max_geust_num: 3, other_needs: [OtherNeed(name: "Állatbarát"), OtherNeed(name: "Nem-dohányzó")], additional_info: "", price_per_night: 10000, image: "house.circle.fill"),
        Accommodation(id: 2, user_id: 2, address: "Budapest, Külső Szilágyi út 1.", geo_long: 1.1, geo_lat: 27.5, type: .couch, max_geust_num: 1, other_needs: [OtherNeed(name: "Nem-dohányzó")], additional_info: "Példa kanapé", price_per_night: 1000, image: "house.circle.fill")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<results.count) { index in
                    AccommListItemView(accommodation: results[index])
                }
            }
            .navigationTitle(nav_title)
        }
    }
}

struct AccomListView_Previews: PreviewProvider {
    static var previews: some View {
        AccommListView()
    }
}
