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
    
    @State private var rent_city: String = ""
    @State private var rent_postal_code: String = ""
    @State private var rent_street: String = ""
    @State private var rent_latitude: String = ""
    @State private var rent_longitude: String = ""
    @State private var accom_type = 1
    @State private var accepted_payment_methods = [
        AcceptedPaymentMethod(name: "Készpénz"),
        AcceptedPaymentMethod(name: "Bankkártya"),
        AcceptedPaymentMethod(name: "PayPal")
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
                        TextField("Város", text: $rent_city)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        TextField("Irányítószám", text: $rent_postal_code)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        TextField("Utca", text: $rent_street)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        HStack(spacing: 50) {
                            TextField("Szélességi koord.", text: $rent_latitude)
                                .frame(width: 120, height: 30, alignment: .leading)
                                .keyboardType(.numberPad)
                                .onReceive(Just(rent_latitude)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.rent_latitude = filtered
                                    }
                                }
                            
                            TextField("Hosszúsági koord.", text: $rent_longitude)
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
                        Text("Szállás típusa")
                            .font(.system(size: 14, weight: .bold))
                        
                        Picker(selection: $accom_type, label: Text("Szállás típusa")) {
                            Text("Apartman").tag(1)
                            Text("Szoba").tag(2)
                            Text("Kanapé").tag(3)
                        }
                        
                        // elfogadott fizetési módok
                        Group {
                            Text("Elfogadott fizetési módok")
                                .font(.system(size: 14, weight: .bold))
                            List(accepted_payment_methods, selection: $payment_methods_selections) {
                                Text($0.name)
                            }
                            .frame(minHeight: minRowHeight * 4)
                            .toolbar {EditButton()}
                        }
                        
                        TextField("Ár/éj", text: $price_a_night)
                            .frame(width: 120, height: 30, alignment: .center)
                        
                        // tulajdonságok
                        Group {
                            Text("Tulajdonságok")
                                .font(.system(size: 14, weight: .bold))
                            List(other_needs, selection: $other_needs_selections) {
                                Text($0.name)
                            }
                            .frame(minHeight: minRowHeight * 4)
                            .toolbar {EditButton()}
                        }
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Meghirdet")
                        }
                        .border(.blue)
                    }
                }
            }
            .navigationTitle("Szoba kiadása")
        }
    }
}

struct RentView_Previews: PreviewProvider {
    static var previews: some View {
        RentView()
    }
}
