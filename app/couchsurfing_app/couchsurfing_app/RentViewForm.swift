//
//  RentViewForm.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 21..
//

import SwiftUI

struct RentViewForm: View {
    
    private let nav_title = "Szoba kiadása"
    private let city_tf_text = "Város"
    private let postal_code_tf_text = "Irányítószám"
    private let street_name_tf_text = "Utca"
    private let latitude_text = "Szélességi koord."
    private let longitude_text = "Hosszúsági koord."
    private let geo_data_text = "Földrajzi adatok"
    
    private let accom_type_text = "Szállás típusa"
    private let accom_types = ["Apartman", "Szoba", "Kanapé"]
    
    private let payment_method_text = "Fizetés módja"
    
    private let price_a_night_text = "Ár/éj"
    private let currency_code = "HUF"
    
    private var properties_text: String = "Tulajdonságok"
    
    private var adv_button_text: String = "Meghirdet"
    
    @State private var payment_methods = [PaymentMethod(value: "Készpénz"),
                                   PaymentMethod(value: "Bankkártya"),
                                   PaymentMethod(value: "Ellenszolgáltatás")]
    
    @State private var other_needs = [
        OtherNeed(name: "Nem-dohányzó"),
        OtherNeed(name: "Állatbarát"),
        OtherNeed(name: "Légkondíciónáló"),
        OtherNeed(name: "Parkolóhely biztsoított"),
        OtherNeed(name: "Bicikli tárolás biztosított")
    ]
    
    @State private var rent_city: String = ""
    @State private var rent_postal_code: String = ""
    @State private var rent_street: String = ""
    @State private var rent_latitude:  String = ""
    @State private var rent_longitude: String = ""
    @State private var selected_accom_type = "Apartman"
    @FocusState private var textfield_is_focused: Bool
    @State private var price_a_night = 0.0
    
    var body: some View {
        NavigationView {
            Form {
                // geo data
                Section {
                    TextField(city_tf_text, text: $rent_city)
                        .focused($textfield_is_focused)
                    TextField(postal_code_tf_text, text: $rent_postal_code)
                        .focused($textfield_is_focused)
                    TextField(street_name_tf_text, text: $rent_street)
                        .focused($textfield_is_focused)
                    TextField(latitude_text, text: $rent_latitude)
                        .focused($textfield_is_focused)
                    TextField(longitude_text, text: $rent_longitude)
                        .focused($textfield_is_focused)
                } header: {
                    Text(geo_data_text)
                }
                
                // accomodation type
                Section {
                    Picker(accom_type_text, selection: $selected_accom_type) {
                        ForEach(accom_types, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                // accepted payment methods
                Section {
                    List {
                        ForEach(0..<payment_methods.count) { index in
                            Button(action: {
                                payment_methods[index].is_selected = payment_methods[index].is_selected ? false : true
                            }) {
                                HStack {
                                    if(payment_methods[index].is_selected) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.orange)
                                    }
                                    Text(payment_methods[index].value)
                                    Spacer()
                                }
                            }
                            .foregroundColor(.black)
                        }
                    }
                } header: {
                    Text(payment_method_text)
                }
                
                // price-a-night
                Section {
                    TextField(price_a_night_text, value: $price_a_night, format: .currency(code: Locale.current.currencyCode ?? currency_code))
                        .keyboardType(.decimalPad)
                        .focused($textfield_is_focused)
                } header: {
                    Text(price_a_night_text)
                }
                
                // properties/meeting other needs
                Section {
                    List {
                        ForEach(0..<other_needs.count) { index in
                            Button(action: {
                                other_needs[index].is_selected = other_needs[index].is_selected ? false : true
                            }) {
                                OtherNeedsListItemSelectedView(other_need: other_needs[index])
                            }
                            .foregroundColor(.black)
                        }
                    }
                } header: {
                    Text(properties_text)
                }
                
                // advertise button
                Section {
                    Button(action: {}) {
                        Text(adv_button_text)
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

private struct PaymentMethod: Identifiable {
    var id = UUID()
    var value: String
    var is_selected = false
}

struct RentViewForm_Previews: PreviewProvider {
    static var previews: some View {
        RentViewForm()
    }
}
