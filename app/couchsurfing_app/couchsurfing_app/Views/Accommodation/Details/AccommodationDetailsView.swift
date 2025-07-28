//
//  AccommodationDetailsView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 24/10/2023.
//

import SwiftUI
import MapKit

struct AccommodationDetailsView: View {
    // MARK: - labels and other text values
    // TODO: create constants extension for the labels
    let nav_title: String = "A szállás adatai"
    let addressLabel: String = "Cím:"
    let geoLocationLabel: String = "Földrajzi helyzet:"
    let tooltipText: String = "A koordináták megérintésével megtekintheted az általuk megjelölt földrajzi helyet a térképen!"
    let roomTypeLabel: String = "Szállás típusa:"
    let roomTypeApartmentLabel: String = "Apartman"
    let roomTypeCouchLabel: String = "Kanapé"
    let roomTypeRoomLabel: String = "Szoba"
    let pricePerNightLabel: String = "Ár éjszakánként:"
    let price_per_night_with_chores_label: String = "Ár éjszakánként ellenszolgáltatással:"
    let acceptedPaymentMethodsLabel: String = "Elfogadott fizetési módok:"
    let is_paying_with_chores_accepted_label: String = "Ellenszolgáltatás elfogadott:"
    let maxGuestNumLabel: String = "Maximális vendégszám:"
    let smokingLabel: String = "Dohányzó:"
    let petFriendlyLabel: String = "Kisállatbarát:"
    let airConditionerLabel: String = "Légkondícionáló:"
    let parkingLabel: String = "Parkolás:"
    let bicycleStorageLabel: String = "Biciklitároló:"
    let additionalInfoLabel: String = "Egyéb:"
    let bookButtonLabel: String = "Lefoglalom"
    let accommodation_owner_profile_button_label: String = "A kiadó profilja"
    
    @StateObject private var viewModel = AccommodationDetailsViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                CarouselView(index: $viewModel.data.currentCarouselIndex, cardPadding: 100, items: viewModel.data.accommodation.roomImages, id: \.id) {roomImage, cardSize in
                    Image(roomImage.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: cardSize.width, height: cardSize.height)
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                }
                .padding(.horizontal, -15)
                .padding(.vertical)
                
                // TODO: add fading design to the bottom of the scroll view
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        AccommodationDetialsKeyValueView(key: addressLabel, value: viewModel.data.accommodation.address)
                        
                        HStack {
                            Text(geoLocationLabel)
                                .bold()
                            
                            Button(action: {
                                viewModel.data.isTooltipAlertShown = !viewModel.data.isTooltipAlertShown
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.leading, -2)
                            .padding(.trailing, 5)
                            .alert(tooltipText, isPresented: $viewModel.data.isTooltipAlertShown) {
                                Button("OK", role: .cancel) {}
                            }
                            
                            Text("\(viewModel.data.accommodation.geoWidth), \(viewModel.data.accommodation.geoLength)")
                                .onTapGesture {
                                    viewModel.openLocationOnMap()
                                }
                        }
                        
                        switch viewModel.data.accommodation.roomType {
                        case .apartment:
                            AccommodationDetialsKeyValueView(key: roomTypeLabel, value: roomTypeApartmentLabel)
                        case .couch:
                            AccommodationDetialsKeyValueView(key: roomTypeLabel, value: roomTypeCouchLabel)
                        case .room:
                            AccommodationDetialsKeyValueView(key: roomTypeLabel, value: roomTypeRoomLabel)
                        }
                        
                        switch viewModel.data.accommodation.currency {
                        case .HUF:
                            AccommodationDetialsKeyValueView(key: pricePerNightLabel, value: "\(Int(viewModel.data.accommodation.price.rounded())) Ft")
                        case .EUR:
                            AccommodationDetialsKeyValueView(key: pricePerNightLabel, value: "€\(viewModel.data.accommodation.price)")
                        case .USD:
                            AccommodationDetialsKeyValueView(key: pricePerNightLabel, value: "$\(viewModel.data.accommodation.price)")
                        }
                        
                        if viewModel.data.accommodation.isPayingWithChoresAccepted,
                           let price = viewModel.data.accommodation.priceWithChores {
                            switch viewModel.data.accommodation.currency {
                            case .HUF:
                                AccommodationDetialsKeyValueView(key: price_per_night_with_chores_label, value: "\(Int(price.rounded())) Ft")
                            case .EUR:
                                AccommodationDetialsKeyValueView(key: price_per_night_with_chores_label, value: "€\(price)")
                            case .USD:
                                AccommodationDetialsKeyValueView(key: price_per_night_with_chores_label, value: "$\(price)")
                            }
                        }
                        
                        HStack(alignment: .top) {
                            Text(acceptedPaymentMethodsLabel)
                                .bold()
                            
                            VStack(alignment: .leading, spacing: 1) {
                                ForEach(0..<viewModel.data.accommodation.acceptedPaymentMethods.count) {
                                    switch viewModel.data.accommodation.acceptedPaymentMethods[$0] {
                                    case .CASH:
                                        Text("– Készpénz")
                                    case .CARD:
                                        Text("– Bankkártya")
                                    case .CHORE:
                                        Text("– Ellenszolgáltatás")
                                    }
                                }
                            }
                        }
                        
                        AccommodationDetialsKeyValueView(
                            key: is_paying_with_chores_accepted_label,
                            value: viewModel.data.accommodation.isPayingWithChoresAccepted ? "✅" : "❌"
                        )
                        
                        AccommodationDetialsKeyValueView(
                            key: maxGuestNumLabel,
                            value: "\(viewModel.data.accommodation.maxGuestNum) fő"
                        )
                        
                        AccommodationDetialsKeyValueView(
                            key: smokingLabel,
                            value: viewModel.data.accommodation.isNonSmoking ? "❌" : "✅"
                        )

                        AccommodationDetialsKeyValueView(
                            key: petFriendlyLabel,
                            value: viewModel.data.accommodation.isPetFriendly ? "✅" : "❌"
                        )
                        
                        AccommodationDetialsKeyValueView(
                            key: airConditionerLabel,
                            value: viewModel.data.accommodation.isAirConditioned ? "✅" : "❌"
                        )
                        
                        AccommodationDetialsKeyValueView(
                            key: parkingLabel,
                            value: viewModel.data.accommodation.isParkingAvailable ? "✅" : "❌"
                        )
                        
                        AccommodationDetialsKeyValueView(
                            key: bicycleStorageLabel,
                            value: viewModel.data.accommodation.isBicycleStorageAvailable ? "✅" : "❌"
                        )
                        
                        if let additionalInfo = viewModel.data.accommodation.additionalInfo {
                            AccommodationDetialsKeyValueView(
                                key: additionalInfoLabel,
                                value: additionalInfo,
                                alignment: .top
                            )
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 8)
                
                HStack (spacing: 16) {
                    NavigationLink(destination: ConfirmBookingView()) {
                        Text(bookButtonLabel)
                    }
                    .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                    
                    NavigationLink(destination: OtherUserProfileView()) {
                        Text(accommodation_owner_profile_button_label)
                    }
                    .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
                }
            }
            .padding([.horizontal, .top], 15)
            .navigationTitle(nav_title)
        }
    }
}

#Preview {
    AccommodationDetailsView()
}
