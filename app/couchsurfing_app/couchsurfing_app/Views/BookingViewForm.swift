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
    private let price_currency_picker_text = "Pénznem"
    private let price_currency_picker_HUF_text = "Magyar forint"
    private let price_currency_picker_EUR_text = "Euró"
    private let price_currency_picker_USD_text = "Amerikai dollár"
    private let price_currency_picker_values: [Currency] = [.HUF, .EUR, .USD]
    private let price_range_text = "Preferált árkategória"
    private let from_text = "-tól"
    private let to_text = "-ig"
    private let rating_range_text = "Preferált értékelés"
    private let other_needs_text = "Egyéb igények"
    private let search_text = "Keresés"

    @FocusState private var textfield_is_focused: Bool
    @StateObject private var view_model = ViewModel()
    
    var body: some View {
        NavigationStack(path: $view_model.navigationPath) {
            Form {
                // city textfield
                Section {
                    TextField(city_tf_text, text: $view_model.booking_city)
                        .focused($textfield_is_focused)
                    
                    // stay start and end date
                    DatePicker(stay_start_text, selection: $view_model.stay_start_date, in: Date()..., displayedComponents: [.date])
                    
                    DatePicker(stay_end_text, selection: $view_model.stay_end_date, in: Calendar.current.date(byAdding: .day, value: 1, to: view_model.stay_start_date)!..., displayedComponents: [.date])
                } header: {
                    Text(basic_info_text)
                }
                
                // preferred payment method
                Section {
                    List {
                        ForEach(0..<view_model.payment_methods.count, id: \.self) { index in
                            Button(action: {
                                view_model.payment_methods[index].is_selected = view_model.payment_methods[index].is_selected ? false : true
                            }) {
                                ListItemSelectedView(list_item: view_model.payment_methods[index])
                            }
                            .foregroundColor(.black)
                        }
                    }
                } header: {
                    Text(payment_method_text)
                }
                
                // price range
                Section {
                    Picker(price_currency_picker_text, selection: $view_model.preferred_price_currency) {
                        ForEach(price_currency_picker_values, id: \.self) { currency in
                            switch currency {
                            case .HUF:
                                Text(price_currency_picker_HUF_text)
                            case .EUR:
                                Text(price_currency_picker_EUR_text)
                            case .USD:
                                Text(price_currency_picker_USD_text)
                            }
                            
                        }
                    }
                    
                    Toggle(from_text, isOn: $view_model.preferred_price_range_from_toggle.animation())
                    if(view_model.preferred_price_range_from_toggle) {
                        TextField(from_text, value: $view_model.price_from, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                        // using .decimalPad prevents entering invalid texts and filtering input data automatically
                    }
                    
                    Toggle(to_text, isOn: $view_model.preferred_price_range_to_toggle.animation())
                    
                    if(view_model.preferred_price_range_to_toggle) {
                        TextField(to_text, value: $view_model.price_to, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                    }
                } header: {
                    Text(price_range_text)
                }
                
                // rating range
                Section {
                    Toggle(from_text, isOn: $view_model.preferred_rating_range_from.animation())
                    if(view_model.preferred_rating_range_from) {
                        TextField(from_text, value: $view_model.rating_from, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                    }
                    
                    Toggle(to_text, isOn: $view_model.preferred_rating_range_to.animation())
                    if(view_model.preferred_rating_range_to) {
                        TextField(to_text, value: $view_model.rating_to, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($textfield_is_focused)
                    }
                } header: {
                    Text(rating_range_text)
                }
                
                // other needs
                Section {
                    List {
                        ForEach(0..<view_model.other_needs.count, id: \.self) {index in
                            Button(action: {
                                view_model.other_needs[index].is_selected = view_model.other_needs[index].is_selected ? false : true
                            }) {
                                ListItemSelectedView(list_item: view_model.other_needs[index])
                            }
                            .foregroundColor(.black)
                        }
                    }
                } header: {
                    Text(other_needs_text)
                }
                
                // search button
                Section {
                    Button(search_text) {
                        Task {
                            await view_model.fetchRooms()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.black)
                    .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                    /*
                    NavigationLink(destination: AccommListView()) {
                        Text(search_text)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.black)
                    .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                     */
                }
                .font(.title)
                .disabled(view_model.booking_city.isEmpty)
                
            }
            .navigationTitle(nav_title)
            //.navigationDestination(for: <#T##Hashable.Protocol#>, destination: <#T##(Hashable) -> View#>)
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
