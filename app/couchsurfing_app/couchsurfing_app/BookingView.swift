//
//  BookingView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 31..
//

import SwiftUI
import Combine

struct BookingView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @State private var booking_city: String = ""
    @State private var booking_start = Date()
    @State private var booking_end = Date()
    @State private var payment_method = 1
    @State private var price_from = ""
    @State private var price_to = ""
    @State private var rating_from = ""
    @State private var rating_to = ""
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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {                    
                    TextField("Város", text: $booking_city)
                        .frame(width: 300, height: 30, alignment: .center)
                    
                    HStack(spacing: 50) {
                        VStack {
                            Text("Tartózkodás kezdete")
                                .font(.system(size: 14, weight: .bold))
                            DatePicker("Tartózkodás kezdete", selection: $booking_start, displayedComponents: [.date])
                                .frame(width: 125, height: 30, alignment: .center)
                        }
                        VStack {
                            Text("Tartózkodás vége")
                                .font(.system(size: 14, weight: .bold))
                            DatePicker("Tartózkodás kezdete", selection: $booking_end, displayedComponents: [.date])
                                .frame(width: 125, height: 30, alignment: .center)
                        }
                    }
                    
                    Text("Fizetés módja")
                        .font(.system(size: 14, weight: .bold))
                    
                    Picker(selection: $payment_method, label: Text("Fizetés módja")) {
                        Text("Bankkártya").tag(1)
                        Text("Készpénz").tag(2)
                        Text("Ellenszolgáltatás").tag(3)
                    }
                    
                    Text("Preferált árkategória")
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack(spacing: 50) {
                        VStack {
                            Text("-tól")
                                .font(.system(size: 12))
                            TextField("-tól", text: $price_from)
                                .keyboardType(.numberPad)
                                .onReceive(Just(price_from)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.price_from = filtered
                                    }
                                }
                        }
                        VStack {
                            Text("-ig")
                                .font(.system(size: 12))
                            TextField("-ig", text: $price_to)
                                .keyboardType(.numberPad)
                                .onReceive(Just(price_to)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.price_to = filtered
                                    }
                                }
                        }
                    }
                    
                    Text("Preferált értékelés")
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack(spacing: 50) {
                        VStack {
                            Text("-tól")
                                .font(.system(size: 12))
                            TextField("-tól", text: $rating_from)
                                .keyboardType(.numberPad)
                                .onReceive(Just(rating_from)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.rating_from = filtered
                                    }
                                }
                        }
                        VStack {
                            Text("-ig")
                                .font(.system(size: 12))
                            TextField("-ig", text: $rating_to)
                                .keyboardType(.numberPad)
                                .onReceive(Just(rating_to)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.rating_to = filtered
                                    }
                                }
                        }
                    }
                    
                    Group {
                        Text("Egyéb igények")
                            .font(.system(size: 14, weight: .bold))
                        
                        List(other_needs, selection: $other_needs_selections) {
                            Text($0.name)
                        }
                        .frame(minHeight: minRowHeight * 4)
                        .toolbar {EditButton()}
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Keresés")
                        }
                        .border(.blue)
                    }
                }
            }
            .navigationTitle("Foglalás")
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
