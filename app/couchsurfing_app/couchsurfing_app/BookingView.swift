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
    
    private var city_tf_text: String = "Város"
    private var stay_start_text: String = "Tartózkodás kezdete"
    private var stay_end_text: String = "Tartózkodás vége"
    private var payment_method_text: String = "Fizetés módja"
    private var payment_method_cash: String = "Készpénz"
    private var payment_method_card: String = "Bankkártya"
    private var payment_method_service: String = "Ellenszolgáltatás"
    private var preferred_price_range_text: String = "Preferált árkategória"
    private var from_text: String = "-tól"
    private var to_text: String = "-ig"
    private var preferred_ratings_text: String = "Preferált értékelés"
    private var other_needs_text: String = "Egyéb igények"
    private var search_text: String = "Keresés"
    private var nav_title = "Foglalás"
    
    
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
                    TextField(city_tf_text, text: $booking_city)
                        .frame(width: 300, height: 30, alignment: .center)
                    
                    HStack(spacing: 50) {
                        VStack {
                            Text(stay_start_text)
                                .font(.system(size: 14, weight: .bold))
                            DatePicker(stay_start_text, selection: $booking_start, displayedComponents: [.date])
                                .frame(width: 125, height: 30, alignment: .center)
                        }
                        VStack {
                            Text(stay_end_text)
                                .font(.system(size: 14, weight: .bold))
                            DatePicker(stay_end_text, selection: $booking_end, displayedComponents: [.date])
                                .frame(width: 125, height: 30, alignment: .center)
                        }
                    }
                    
                    Text(payment_method_text)
                        .font(.system(size: 14, weight: .bold))
                    
                    Picker(selection: $payment_method, label: Text(payment_method_text)) {
                        Text(payment_method_card).tag(1)
                        Text(payment_method_cash).tag(2)
                        Text(payment_method_service).tag(3)
                    }
                    
                    Text(preferred_price_range_text)
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack(spacing: 50) {
                        VStack {
                            Text(from_text)
                                .font(.system(size: 12))
                            TextField(from_text, text: $price_from)
                                .keyboardType(.numberPad)
                                .onReceive(Just(price_from)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.price_from = filtered
                                    }
                                }
                        }
                        VStack {
                            Text(to_text)
                                .font(.system(size: 12))
                            TextField(to_text, text: $price_to)
                                .keyboardType(.numberPad)
                                .onReceive(Just(price_to)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.price_to = filtered
                                    }
                                }
                        }
                    }
                    
                    Text(preferred_price_range_text)
                        .font(.system(size: 14, weight: .bold))
                    
                    HStack(spacing: 50) {
                        VStack {
                            Text(from_text)
                                .font(.system(size: 12))
                            TextField(from_text, text: $rating_from)
                                .keyboardType(.numberPad)
                                .onReceive(Just(rating_from)) { newValue in
                                    let filtered = newValue.filter { "0123456789".contains($0) }
                                    if filtered != newValue {
                                        self.rating_from = filtered
                                    }
                                }
                        }
                        VStack {
                            Text(to_text)
                                .font(.system(size: 12))
                            TextField(to_text, text: $rating_to)
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
                        Text(other_needs_text)
                            .font(.system(size: 14, weight: .bold))
                        
                        List(other_needs, selection: $other_needs_selections) {
                            Text($0.name)
                        }
                        .frame(minHeight: minRowHeight * 4)
                        .toolbar {EditButton()}
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text(search_text)
                        }
                        .border(.blue)
                    }
                }
            }
            .navigationTitle(nav_title)
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
