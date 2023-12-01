//
//  ConfirmBookingView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 11/11/2023.
//

import SwiftUI

struct ConfirmBookingView: View {
    //MARK: booking properties - partly from the search conditions, partly from room data
    let start_date_from_search: Date = Date()
    let end_date_from_search: Date = Date()
    let max_guest_num: Int = 3
    let is_payment_with_chores_accepted: Bool = true
    let price: Float = 10000.0
    let price_with_chores: Float = 7500.0
    let currency: Currency = .HUF
    
    //MARK: view data
    let nav_title: String = "Foglalás megerősítése"
    let stay_date_section_header: String = "Tartózkodás ideje"
    let stay_start_text: String = "Tartózkodás kezdete"
    let stay_end_text: String = "Tartózkodás vége"
    let button_text: String = "Foglalás indítása"
    
    let num_of_guests_section_header: String = "Hány fő érkezik?"
    let num_of_guests_picker_text: String = "Személyek száma"
    var guest_num_picker_options: [Int] = []
    
    
    let payment_method_section_header: String = "Milyen módon szeretne fizetni?"
    let payment_method_text: String = "Fizetési mód"
    let card_text: String = "Bankkártya"
    let cash_text: String = "Készpénz"
    let chores_text: String = "Ellenszolgáltatás"
    let chores_tooltip_text: String = "Amennyiben elfogadja a fizetést ellenszolgáltatás igénybevételével, úgy alacsonyabb árat kell fizetnie a szállásáért, cserébe elfogadja az ellenszolgáltatás keretében elvégzendő ház körüli munkák elvégzését."
    let accepted_payment_methods: [PaymentMethod] = [.CASH, .CARD]
    
    let payment_with_chores_section_header: String = "Fizetés ellenszolgáltatás igénybevételével"
    
    let additional_notes_section_header: String = "Van valamilyen megjegyzése a szállásadója számára?"
    let additional_notes_placeholder_text: String = "Egyéb megjegyzések..."
    
    let summary_section_header: String = "Foglalás összegzése"
    let date_formatter = DateFormatter()
    let summary_num_of_guests_text: String = "Érkező személyek száma"
    let summary_price_per_night: String = "Ár/éjszaka"
    let summary_additional_notes_text: String = "Egyéb megjegyzések"
    
    @State private var stay_start_date: Date
    @State private var stay_end_date: Date
    @State private var num_of_guests: Int = 1
    @State private var selected_payment_method: PaymentMethod
    @State private var pay_with_chores: [ListItem] = [
        ListItem(name: "Elfogadom")
    ]
    @State private var additional_notes_text: String = "Egyéb megjegyzések..."
    @State var is_chores_tooltip_alert_shown = false
    @FocusState private var textfield_is_focused: Bool
    
    init() {
        _stay_start_date = State(initialValue: start_date_from_search)
        _stay_end_date = State(initialValue: end_date_from_search)
        _selected_payment_method = State(initialValue: accepted_payment_methods[0])
        
        for i in 1...max_guest_num {
            guest_num_picker_options.append(i)
        }
        
        date_formatter.dateFormat = "d MMM y"
    }
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: stay start and end date
                Section {
                    // stay start and end date
                    DatePicker(stay_start_text, selection: $stay_start_date, in: Date()..., displayedComponents: [.date])
                    
                    DatePicker(stay_end_text, selection: $stay_end_date, in: Calendar.current.date(byAdding: .day, value: 1, to: stay_start_date)!..., displayedComponents: [.date])
                } header: {
                    Text(stay_date_section_header)
                }
                
                Section {
                    Picker(num_of_guests_picker_text, selection: $num_of_guests) {
                        ForEach(guest_num_picker_options, id: \.self) {guest_num_option in
                            Text("\(guest_num_option)")
                        }
                    }
                } header: {
                    Text(num_of_guests_section_header)
                }
                
                //MARK: payment method
                Section {
                    Picker(payment_method_text, selection: $selected_payment_method) {
                        ForEach(accepted_payment_methods, id: \.self) {payment_method in
                            Text(map_method_to_text(payment_method: payment_method))
                        }
                    }
                } header: {
                    Text(payment_method_section_header)
                }
                
                //MARK: payment with chores
                if(is_payment_with_chores_accepted) {
                    Section {
                        Button(action: {
                            pay_with_chores[0].is_selected = pay_with_chores[0].is_selected ? false : true
                        }) {
                            ListItemSelectedView(list_item: pay_with_chores[0])
                        }
                        .foregroundColor(.black)
                    } header: {
                        HStack {
                            Text(payment_with_chores_section_header)
                            
                            Button(action: {
                                is_chores_tooltip_alert_shown = !is_chores_tooltip_alert_shown
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.leading, -2)
                            .padding(.trailing, 5)
                            .alert(chores_tooltip_text, isPresented: $is_chores_tooltip_alert_shown) {
                                Button("OK", role: .cancel) {}
                            }
                        }
                    }
                }
                
                //MARK: additional notes
                Section {
                    TextEditor(text: $additional_notes_text)
                        .foregroundColor(additional_notes_text == additional_notes_placeholder_text ? .gray : .primary)
                        .onTapGesture {
                            if additional_notes_text == additional_notes_placeholder_text {
                                additional_notes_text = ""
                            }
                        }
                        .focused($textfield_is_focused)
                } header: {
                    Text(additional_notes_section_header)
                }
                
                //MARK: booking summary
                Section {
                    VStack (alignment: .leading, spacing: 8) {
                        HStack {
                            Text(stay_start_text + ":")
                                .bold()
                            
                            Text(date_formatter.string(from: stay_start_date))
                        }
                        
                        HStack {
                            Text(stay_end_text + ":")
                                .bold()
                            
                            Text(date_formatter.string(from: stay_end_date))
                        }
                        
                        HStack {
                            Text(payment_method_text + ":")
                                .bold()
                            
                            Text(map_method_to_text(payment_method: selected_payment_method))
                        }
                        
                        HStack {
                            Text(summary_price_per_night + ":")
                                .bold()
                            
                            Text(map_price_to_text(regular_price: price, price_with_chores: price_with_chores, pay_with_chores: pay_with_chores[0].is_selected, currency: currency))
                        }
                        
                        HStack (alignment: .bottom) {
                            Text(payment_with_chores_section_header + ": \(pay_with_chores[0].is_selected ? "✅" : "❌")")
                                .bold()
                        }
                        
                        HStack {
                            Text(summary_num_of_guests_text + ":")
                                .bold()
                            
                            Text(String(num_of_guests))
                        }
                        
                        if (additional_notes_text != additional_notes_placeholder_text && additional_notes_text != "") {
                            HStack (alignment: .top) {
                                Text(summary_additional_notes_text + ":")
                                    .bold()
                                
                                Text(String(additional_notes_text))
                            }
                        }
                    }
                } header: {
                    Text(summary_section_header)
                        .font(.headline)
                }
                
                Section {
                    Button(action: {}) {
                        Text(button_text)
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
    
    private func map_method_to_text(payment_method: PaymentMethod) -> String {
        switch payment_method {
        case .CARD:
            card_text
        case .CASH:
            cash_text
        case .CHORE:
            chores_text
        }
    }
    
    private func map_price_to_text(regular_price: Float, price_with_chores: Float?, pay_with_chores: Bool, currency: Currency) -> String {
        if (self.is_payment_with_chores_accepted && pay_with_chores && price_with_chores != nil) {
            switch currency {
            case .HUF:
                return "\(Int(price_with_chores!.rounded())) Ft"
            case .EUR:
                return "€ \(price_with_chores!)"
            case .USD:
                return "$ \(price_with_chores!)"
            }
        }
        
        switch currency {
        case .HUF:
            return "\(Int(regular_price.rounded())) Ft"
        case .EUR:
            return "€ \(regular_price)"
        case .USD:
            return "$ \(regular_price)"
        }
    }
}

#Preview {
    ConfirmBookingView()
}
