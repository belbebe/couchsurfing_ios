//
//  BookingViewForm.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 20..
//

import SwiftUI

struct BookingViewForm: View {
    
    private let nav_title = "Foglalás"
    private let basic_info_text = "Kötelező mezők"
    private let city_tf_text = "Város"
    private let stay_start_text = "Tartózkodás kezdete"
    private let stay_end_text = "Tartózkodás vége"
    private let payment_method_text = "Fizetés módja"
    //private let payment_methods = ["Készpénz", "Bankkártya", "Ellenszolgáltatás"]
    private let price_range_text = "Preferált árkategória (HUF)"
    private let from_text = "-tól"
    private let to_text = "-ig"
    private let rating_range_text = "Preferált értékelés"
    private let other_needs_text = "Egyéb igények"
    private let search_text = "Keresés"
    private let currency_code = "HUF"
    
    @State private var payment_methods = [
        ListItem(name: "Készpénz"),
        ListItem(name: "Bankkártya"),
        ListItem(name: "Ellenszolgáltatás")
    ]
    
    @State private var other_needs = [
        ListItem(name: "Nem-dohányzó"),
        ListItem(name: "Állatbarát"),
        ListItem(name: "Légkondíciónáló"),
        ListItem(name: "Parkolóhely biztsoított"),
        ListItem(name: "Bicikli tárolás biztosított")
    ]
    
    @State private var booking_city = ""
    @State private var stay_start_date = Date()
    @State private var stay_end_date = Date()
    @State private var selected_payment_method = "Készpénz"
    
    @State private var preferred_price_range_from_toggle = false
    @State private var preferred_price_range_to_toggle = false
    @State private var price_from = 0.0
    @State private var price_to = 0.0
    @FocusState private var textfield_is_focused: Bool
    
    @State private var preferred_rating_range_from = false
    @State private var preferred_rating_range_to = false
    @State private var rating_from = 0.0
    @State private var rating_to = 0.0
    
    @State private var other_needs_selections = Set<UUID>()
    
    var body: some View {
        NavigationView {
            Form {
                // city textfield
                Section {
                    TextField(city_tf_text, text: $booking_city)
                        .focused($textfield_is_focused)
                    
                    // stay start and end date
                    DatePicker(stay_start_text, selection: $stay_start_date, in: Date()..., displayedComponents: [.date])
                    
                    DatePicker(stay_end_text, selection: $stay_end_date, in: Calendar.current.date(byAdding: .day, value: 1, to: Date())!..., displayedComponents: [.date])
                } header: {
                    Text(basic_info_text)
                }
                
                // preferred payment method
                Section {
                    List {
                        ForEach(0..<payment_methods.count, id: \.self) { index in
                            Button(action: {
                                payment_methods[index].is_selected = payment_methods[index].is_selected ? false : true
                            }) {
                                ListItemSelectedView(list_item: payment_methods[index])
                            }
                            .foregroundColor(.black)
                        }
                    }
                } header: {
                    Text(payment_method_text)
                }
                
                // price range
                Section {
                    Toggle(from_text, isOn: $preferred_price_range_from_toggle)
                    if(preferred_price_range_from_toggle) {
                        TextField(from_text, value: $price_from, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                        // using .decimalPad prevents entering invalid texts and filtering input data automatically
                    }
                    
                    Toggle(to_text, isOn: $preferred_price_range_to_toggle)
                    if(preferred_price_range_to_toggle) {
                        TextField(to_text, value: $price_to, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                    }
                } header: {
                    Text(price_range_text)
                }
                
                // rating range
                Section {
                    Toggle(from_text, isOn: $preferred_rating_range_from)
                    if(preferred_rating_range_from) {
                        TextField(from_text, value: $rating_from, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                    }
                    
                    Toggle(to_text, isOn: $preferred_rating_range_to)
                    if(preferred_rating_range_to) {
                        TextField(to_text, value: $rating_to, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                    }
                } header: {
                    Text(rating_range_text)
                }
                
                // other needs
                Section {
                    List {
                        ForEach(0..<other_needs.count, id: \.self) {index in
                            Button(action: {
                                other_needs[index].is_selected = other_needs[index].is_selected ? false : true
                            }) {
                                ListItemSelectedView(list_item: other_needs[index])
                            }
                            .foregroundColor(.black)
                        }
                    }
                } header: {
                    Text(other_needs_text)
                }
                
                // search button
                Section {
                    NavigationLink(destination: AccommListView()) {
                        Text(search_text)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.black)
                    .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                }
                .font(.title)
                
            }
            .navigationTitle(nav_title)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        textfield_is_focused = false
                    }
                }
            }
        }
    }
}

struct BookingViewForm_Previews: PreviewProvider {
    static var previews: some View {
        BookingViewForm()
    }
}
