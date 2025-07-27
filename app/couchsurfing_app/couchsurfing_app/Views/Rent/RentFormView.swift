//
//  RentFormView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 21..
//

import SwiftUI

struct RentFormView: View {
    
    private let navTitle = "Szoba kiadása"
    private let cityTextfieldLabel = "Város"
    private let postalCodeTextfieldLabel = "Irányítószám"
    private let streetNameTextfieldLabel = "Utca"
    private let latitudeLabel = "Szélességi koord."
    private let longitudeLabel = "Hosszúsági koord."
    private let geoDataLabel = "Földrajzi adatok"
    private let accomodationTypeLabel = "Szállás típusa"
    private let paymentMethodLabel = "Fizetés módja"
    private let pricePerNightLabel = "Ár/éj"
    private let currencyCode = "HUF"
    private var propertiesLabel = "Tulajdonságok"
    private var postButtonText = "Meghirdet"
    
    @FocusState private var textfieldIsFocused: Bool
    
    @StateObject private var viewModel = RentFormViewModel()
    
    var body: some View {
        // TODO: change this to NavigationStack(path: $viewModel.data.navigationPath)
        NavigationView {
            Form {
                // geo data
                Section {
                    VStack {
                        TextField(cityTextfieldLabel, text: $viewModel.data.rentCity)
                            .focused($textfieldIsFocused)
                        TextField(postalCodeTextfieldLabel, text: $viewModel.data.rentPostalCode)
                            .focused($textfieldIsFocused)
                        TextField(streetNameTextfieldLabel, text: $viewModel.data.rentStreet)
                            .focused($textfieldIsFocused)
                        TextField(latitudeLabel, text: $viewModel.data.rentLatitude)
                            .focused($textfieldIsFocused)
                        TextField(longitudeLabel, text: $viewModel.data.rentLongitude)
                            .focused($textfieldIsFocused)
                    }
                } header: {
                    Text(geoDataLabel)
                }
                
                // accomodation type
                Section {
                    Picker(accomodationTypeLabel, selection: $viewModel.data.selectedAccomodationType) {
                        ForEach(viewModel.data.accomodationTypes, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                // accepted payment methods
                SectionWithSelectableListItemsView(
                    listItems: viewModel.data.paymentMethods,
                    header: Text(paymentMethodLabel)
                )
                
                // price-a-night
                Section {
                    TextField(pricePerNightLabel, value: $viewModel.data.pricePerNight, format: .currency(code: Locale.current.currencyCode ?? currencyCode))
                        .keyboardType(.decimalPad)
                        .focused($textfieldIsFocused)
                } header: {
                    Text(pricePerNightLabel)
                }
                
                // properties/meeting other needs
                SectionWithSelectableListItemsView(
                    listItems: viewModel.data.otherNeeds,
                    header: Text(propertiesLabel)
                )
                
                // post advertisement button
                Section {
                    Button(action: {}) {
                        Text(postButtonText)
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

struct RentFormView_Previews: PreviewProvider {
    static var previews: some View {
        RentFormView()
    }
}
