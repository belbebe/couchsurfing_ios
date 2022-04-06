//
//  RentView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 30..
//

import SwiftUI
import Combine

struct RentView: View {
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    private var city_tf_text: String = "Város"
    private var postal_code_tf_text: String = "Irányítószám"
    private var street_name_tf_text: String = "Utca"
    private var latitude_text: String = "Szélességi koord."
    private var longitude_text: String = "Hosszúsági koord."
    private var accom_type_text: String = "Szállás típusa"
    private var type_apartment: String = "Apartman"
    private var type_room: String = "Szoba"
    private var type_couch: String = "Kanapé"
    private var payment_methods_text: String = "Elfogadott fizetési módok"
    private var price_a_night_text: String = "Ár/éj"
    private var properties_text: String = "Tulajdonságok"
    private var adv_button_text: String = "Meghirdet"
    private var nav_title: String = "Szoba kiadása"
    
    
    @State private var rent_city: String = ""
    @State private var rent_postal_code: String = ""
    @State private var rent_street: String = ""
    @State private var rent_latitude: String = ""
    @State private var rent_longitude: String = ""
    @State private var accom_type = 1
    @State private var accepted_payment_methods = [
        AcceptedPaymentMethod(name: "Készpénz"),
        AcceptedPaymentMethod(name: "Bankkártya"),
        AcceptedPaymentMethod(name: "PayPal"),
        AcceptedPaymentMethod(name: "Ellenszolgáltatás")
    ]
    @State private var payment_methods_selections = Set<UUID>()
    @State private var price_a_night = ""
    @State private var other_needs = [
        OtherNeed(name: "Nem-dohányzó"),
        OtherNeed(name: "Állatbarát"),
        OtherNeed(name: "Légkondíciónáló"),
        OtherNeed(name: "Parkolóhely biztsoított"),
        OtherNeed(name: "Bicikli tárolás biztosított")
    ]
    @State private var other_needs_selections = Set<UUID>()
    
    private struct OtherNeed: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    
    private struct AcceptedPaymentMethod: Hashable, Identifiable {
        let name: String
        let id = UUID()
    }
    
    var body: some View {
        // "Szoba kiadása" tab
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    // cím adatok megadása
                    Group {
                        TextField(city_tf_text, text: $rent_city)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        TextField(postal_code_tf_text, text: $rent_postal_code)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        TextField(street_name_tf_text, text: $rent_street)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        HStack(spacing: 50) {
                            TextField(latitude_text, text: $rent_latitude)
                                .frame(width: 120, height: 30, alignment: .leading)
                                .keyboardType(.numberPad)
                                .onReceive(Just(rent_latitude)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.rent_latitude = filtered
                                    }
                                }
                            
                            TextField(longitude_text, text: $rent_longitude)
                                .frame(width: 120, height: 30, alignment: .trailing)
                                .keyboardType(.numberPad)
                                .onReceive(Just(rent_longitude)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.rent_longitude = filtered
                                    }
                                }
                        }
                        
                        // szállás típusa
                        Text(accom_type_text)
                            .font(.system(size: 14, weight: .bold))
                        
                        Picker(selection: $accom_type, label: Text(accom_type_text)) {
                            Text(type_apartment).tag(1)
                            Text(type_room).tag(2)
                            Text(type_couch).tag(3)
                        }
                        
                        // elfogadott fizetési módok
                        Group {
                            Text(payment_methods_text)
                                .font(.system(size: 14, weight: .bold))
                            List(accepted_payment_methods, selection: $payment_methods_selections) {
                                Text($0.name)
                            }
                            .frame(minHeight: minRowHeight * 5)
                            .toolbar {EditButton()}
                        }
                        
                        TextField(price_a_night_text, text: $price_a_night)
                            .frame(width: 120, height: 30, alignment: .center)
                        
                        // tulajdonságok
                        Group {
                            Text(properties_text)
                                .font(.system(size: 14, weight: .bold))
                            List(other_needs, selection: $other_needs_selections) {
                                Text($0.name)
                            }
                            .frame(minHeight: minRowHeight * 4)
                            .toolbar {EditButton()}
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text(adv_button_text)
                        }
                        .border(.blue)
                    }
                }
            }
            .navigationTitle(nav_title)
        }
    }
}

struct RentView_Previews: PreviewProvider {
    static var previews: some View {
        RentView()
    }
}
