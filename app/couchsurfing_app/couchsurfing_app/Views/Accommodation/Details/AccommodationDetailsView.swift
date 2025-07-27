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
                CarouselView(index: $viewModel.data.currentCarouselIndex, cardPadding: 100, items: viewModel.data.roomImages, id: \.id) {roomImage, cardSize in
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
                        HStack {
                            Text(addressLabel)
                                .bold()
                            
                            Text(viewModel.data.address)
                        }
                        
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
                            
                            Text("\(viewModel.data.geoWidth), \(viewModel.data.geoLength)")
                                .onTapGesture {
                                    viewModel.openLocationOnMap()
                                }
                        }
                        
                        HStack {
                            Text(roomTypeLabel)
                                .bold()
                            
                            switch viewModel.data.roomType {
                            case .apartment:
                                Text(roomTypeApartmentLabel)
                                
                            case .couch:
                                Text(roomTypeCouchLabel)
                                
                            case .room:
                                Text(roomTypeRoomLabel)
                            }
                        }
                        
                        HStack {
                            Text(pricePerNightLabel)
                                .bold()
                            
                            switch viewModel.data.currency {
                            case .HUF:
                                Text("\(Int(viewModel.data.price.rounded())) Ft")
                            case .EUR:
                                Text("€\(viewModel.data.price)")
                            case .USD:
                                Text("$\(viewModel.data.price)")
                            }
                        }
                        
                        if (viewModel.data.isPayingWithChoresAccepted) {
                            HStack {
                                Text(price_per_night_with_chores_label)
                                    .bold()
                                
                                switch viewModel.data.currency {
                                case .HUF:
                                    Text("\(Int(viewModel.data.priceWithChores.rounded())) Ft")
                                case .EUR:
                                    Text("€\(viewModel.data.priceWithChores)")
                                case .USD:
                                    Text("$\(viewModel.data.priceWithChores)")
                                }
                            }
                        }
                        
                        HStack(alignment: .top) {
                            Text(acceptedPaymentMethodsLabel)
                                .bold()
                            
                            VStack(alignment: .leading, spacing: 1) {
                                ForEach(0..<viewModel.data.acceptedPaymentMethods.count) {
                                    switch viewModel.data.acceptedPaymentMethods[$0] {
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
                        
                        HStack {
                            Text(is_paying_with_chores_accepted_label)
                                .bold()
                            
                            viewModel.data.isPayingWithChoresAccepted ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(maxGuestNumLabel)
                                .bold()
                            
                            Text("\(viewModel.data.maxGuestNum) fő")
                        }
                        
                        HStack {
                            Text(smokingLabel)
                                .bold()
                            
                            viewModel.data.isNonSmoking ? Text("❌") : Text("✅")
                        }
                        
                        HStack {
                            Text(petFriendlyLabel)
                                .bold()
                            
                            viewModel.data.isPetFriendly ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(airConditionerLabel)
                                .bold()
                            
                            viewModel.data.isAirConditioned ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(parkingLabel)
                                .bold()
                            
                            viewModel.data.isParkingAvailable ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(bicycleStorageLabel)
                                .bold()
                            
                            viewModel.data.isBicycleStorageAvailable ? Text("✅") : Text("❌")
                        }
                        
                        HStack(alignment: .top) {
                            Text(additionalInfoLabel)
                                .bold()
                            
                            Text(viewModel.data.additionalInfo)
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
