//
//  BookingFormView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 20..
//

import SwiftUI

struct BookingFormView: View {
    
    // TODO: add new extension that contains constants
    private let navTitle = "Foglalás"
    private let basicInfoText = "Kötelező mezők"
    private let cityTfText = "Város"
    private let stayStartText = "Tartózkodás kezdete"
    private let stayEndText = "Tartózkodás vége"
    private let paymentMethodText = "Fizetés módja"
    private let priceCurrencyPickerText = "Pénznem"
    private let priceCurrencyPickerHUFText = "Magyar forint"
    private let priceCurrencyPickerEURText = "Euró"
    private let priceCurrencyPickerUSDText = "Amerikai dollár"
    private let priceRangeText = "Preferált árkategória"
    private let fromText = "-tól"
    private let toText = "-ig"
    private let ratingRangeText = "Preferált értékelés"
    private let otherNeedsText = "Egyéb igények"
    private let searchText = "Keresés"

    @FocusState private var textfieldIsFocused: Bool
    
    @StateObject private var viewModel = BookingFormViewModel()
    
    var body: some View {
        // TODO: change this to NavigationStack(path: $viewModel.data.navigationPath)
        NavigationView {
            Form {
                // city textfield
                Section {
                    TextField(cityTfText, text: $viewModel.data.bookingCity)
                        .focused($textfieldIsFocused)
                    
                    // stay start and end date
                    DatePicker(stayStartText, selection: $viewModel.data.stayStartDate, in: Date()..., displayedComponents: [.date])
                    
                    DatePicker(stayEndText, selection: $viewModel.data.stayEndDate, in: Calendar.current.date(byAdding: .day, value: 1, to: Date())!..., displayedComponents: [.date])
                } header: {
                    Text(basicInfoText)
                }
                
                // preferred payment method
                SectionWithSelectableListItemsView(
                    listItems: viewModel.data.paymentMethods,
                    header: Text(paymentMethodText)
                )
                
                // price range
                Section {
                    VStack {
                        Picker(priceCurrencyPickerText, selection: $viewModel.data.preferredPriceCurrency) {
                            ForEach(viewModel.data.priceCurrencyPickerValues, id: \.self) { currency in
                                switch currency {
                                case .HUF:
                                    Text(priceCurrencyPickerHUFText)
                                case .EUR:
                                    Text(priceCurrencyPickerEURText)
                                case .USD:
                                    Text(priceCurrencyPickerUSDText)
                                }
                                
                            }
                        }
                        
                        Toggle(fromText, isOn: $viewModel.data.preferredPriceRangeFrom)
                        if(viewModel.data.preferredPriceRangeFrom) {
                            TextField(fromText, value: $viewModel.data.priceFrom, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($textfieldIsFocused)
                            // using .decimalPad prevents entering invalid texts and filtering input data automatically
                            // additionally number only regex should be used
                        }
                        
                        Toggle(toText, isOn: $viewModel.data.preferredPriceRangeTo)
                        if(viewModel.data.preferredPriceRangeTo) {
                            TextField(toText, value: $viewModel.data.priceTo, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($textfieldIsFocused)
                        }
                    }
                } header: {
                    Text(priceRangeText)
                }
                
                // rating range
                Section {
                    VStack {
                        Toggle(fromText, isOn: $viewModel.data.preferredRatingRangeFrom)
                        if(viewModel.data.preferredRatingRangeFrom) {
                            TextField(fromText, value: $viewModel.data.ratingFrom, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($textfieldIsFocused)
                            
                        }
                        
                        Toggle(toText, isOn: $viewModel.data.preferredRatingRangeTo)
                        if(viewModel.data.preferredRatingRangeTo) {
                            TextField(toText, value: $viewModel.data.ratingTo, format: .number)
                                .keyboardType(.decimalPad)
                                .focused($textfieldIsFocused)
                        }
                    }
                } header: {
                    Text(ratingRangeText)
                }
                
                // other needs
                SectionWithSelectableListItemsView(
                    listItems: viewModel.data.otherNeeds,
                    header: Text(otherNeedsText)
                )
                
                // search button
                Section {
                    NavigationLink(destination: AccommodationListView()) {
                        Text(searchText)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .foregroundColor(.black)
                    .listRowBackground(CouchSurfingCustomColor.buttonBackground)
                }
                .font(.title)
                
            }
            .navigationTitle(navTitle)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        textfieldIsFocused = false
                    }
                }
            }
        }
    }
}

struct BookingFormView_Previews: PreviewProvider {
    static var previews: some View {
        BookingFormView()
    }
}
