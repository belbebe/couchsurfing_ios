//
//  BookingConfirmationView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 11/11/2023.
//

import SwiftUI

struct BookingConfirmationView: View {
    // MARK: - view data
    let nav_title: String = "Foglalás megerősítése"
    let stay_date_section_header: String = "Tartózkodás ideje"
    let stay_start_text: String = "Tartózkodás kezdete"
    let stay_end_text: String = "Tartózkodás vége"
    let button_text: String = "Foglalás indítása"
    
    let num_of_guests_section_header: String = "Hány fő érkezik?"
    let num_of_guests_picker_text: String = "Személyek száma"
    
    
    let payment_method_section_header: String = "Milyen módon szeretne fizetni?"
    let payment_method_text: String = "Fizetési mód"
    let chores_tooltip_text: String = "Amennyiben elfogadja a fizetést ellenszolgáltatás igénybevételével, úgy alacsonyabb árat kell fizetnie a szállásáért, cserébe elfogadja az ellenszolgáltatás keretében elvégzendő ház körüli munkák elvégzését."
    
    let payment_with_chores_section_header: String = "Fizetés ellenszolgáltatás igénybevételével"
    
    let additional_notes_section_header: String = "Van valamilyen megjegyzése a szállásadója számára?"
    let additional_notes_placeholder_text: String = "Egyéb megjegyzések..."
    
    let summary_section_header: String = "Foglalás összegzése"
    let date_formatter = DateFormatter()
    let summary_num_of_guests_text: String = "Érkező személyek száma"
    let summary_price_per_night: String = "Ár/éjszaka"
    let summary_additional_notes_text: String = "Egyéb megjegyzések"
    
    @StateObject private var viewModel = BookingConfirmationViewModel()
    @FocusState private var textfield_is_focused: Bool
    @State private var isAlertShown: Bool = false
    
    init() {}
    
    var body: some View {
        NavigationView {
            Form {
                // MARK: - stay start and end date
                Section {
                    // stay start and end date
                    // TODO: remove date picker and just display the dates given on the form screen!
                    DatePicker(stay_start_text, selection: $viewModel.data.stayStartDate, in: Date()..., displayedComponents: [.date])
                    
                    DatePicker(stay_end_text, selection: $viewModel.data.stayEndDate, in: Calendar.current.date(byAdding: .day, value: 1, to: viewModel.data.stayStartDate)!..., displayedComponents: [.date])
                } header: {
                    Text(stay_date_section_header)
                }
                
                Section {
                    Picker(num_of_guests_picker_text, selection: $viewModel.data.guestNumber) {
                        ForEach(1...viewModel.data.maxGuestNumber, id: \.self) { guest_num_option in
                            Text("\(guest_num_option)")
                        }
                    }
                } header: {
                    Text(num_of_guests_section_header)
                }
                
                // MARK: - payment method
                Section {
                    Picker(payment_method_text, selection: $viewModel.data.selectedPaymentMethod) {
                        ForEach(viewModel.data.acceptedPaymentMethods, id: \.self) { payment_method in
                            Text(viewModel.mapPaymentMethodToText(paymentMethod: payment_method))
                        }
                    }
                } header: {
                    Text(payment_method_section_header)
                }
                
                // MARK: - payment with chores
                if viewModel.data.isPaymentWithChoresAccepted {
                    SectionWithSelectableListItemsView(
                        listItems: $viewModel.data.payWithChores,
                        header: HStack {
                            Text(payment_with_chores_section_header)
                            
                            Button(action: {
                                isAlertShown = !isAlertShown
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.leading, -2)
                            .padding(.trailing, 5)
                            .alert(chores_tooltip_text, isPresented: $isAlertShown) {
                                Button("OK", role: .cancel) {}
                            }
                        }
                    )
                }
                
                // MARK: - additional notes
                Section {
                    TextField(viewModel.data.additionalNotesLabel, text: $viewModel.data.additionalNotesValue)
                        .focused($textfield_is_focused)
                } header: {
                    Text(additional_notes_section_header)
                }
                
                // MARK: - booking summary
                Section {
                    BookingConfirmationSummaryView(
                        stayStartLabel: stay_start_text,
                        stayEndLabel: stay_end_text,
                        paymentMethodLabel: payment_method_text,
                        pricePerNightLabel: summary_price_per_night,
                        paymentWithChoresSectionHeader: payment_with_chores_section_header,
                        guestNumberLabel: summary_num_of_guests_text,
                        additionalNotesLabel: summary_additional_notes_text,
                        viewModel: viewModel
                    )
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
}

#Preview {
    BookingConfirmationView()
}
