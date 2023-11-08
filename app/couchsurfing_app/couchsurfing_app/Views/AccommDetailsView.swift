//
//  AccommDetailsVeiw.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 24/10/2023.
//

import SwiftUI
import MapKit

struct AccommDetailsVeiw: View {
    // TODO: create Model object for the room data
    let address: String = "Budapest, Fő utca 1."
    let geoLength: Float = 19.046716
    let geoWidth: Float = 47.500952
    let roomType: AccomTypeEnum = AccomTypeEnum.room
    let price: Float = 10000.0
    let currency: Currency = .HUF
    let acceptedPaymentMethods: [PaymentMethod] = [.CASH, .CARD]
    let maxGuestNum: Int = 3
    let nonSmoking: Bool = true
    let petFriendly: Bool = true
    let airConditioner: Bool = true
    let parking: Bool = false
    let bicycleStorage: Bool = true
    let additionalInfo: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    
    //MARK: carousel properties
    let roomImages: [AccommImage] = [AccommImage(image: "living_room"), AccommImage(image: "living_room2"), AccommImage(image: "bedroom")]
    @State var currentIndex: Int = 0
    
    //MARK: labels and other text values
    let addressLabel: String = "Cím:"
    let geoLocationLabel: String = "Földrajzi helyzet:"
    let tooltipText: String = "A koordináták megérintésével megtekintheted az általuk megjelölt földrajzi helyet a térképen!"
    let roomTypeLabel: String = "Szállás típusa:"
    let roomTypeApartmentLabel: String = "Apartman"
    let roomTypeCouchLabel: String = "Kanapé"
    let roomTypeRoomLabel: String = "Szoba"
    let pricePerNightLabel: String = "Ár éjszakánként:"
    let acceptedPaymentMethodsLabel: String = "Elfogadott fizetési módok:"
    let maxGuestNumLabel: String = "Maximális vendégszám:"
    let smokingLabel: String = "Dohányzó:"
    let petFriendlyLabel: String = "Kisállatbarát:"
    let airConditionerLabel: String = "Légkondícionáló:"
    let parkingLabel: String = "Parkolás:"
    let bicycleStorageLabel: String = "Biciklitároló:"
    let additionalInfoLabel: String = "Egyéb:"
    let bookButtonLabel: String = "Lefoglalom"
    
    @State var isTooltipAlertShown = false
    
    
    var body: some View {

        NavigationView {
            VStack(spacing: 15) {
                CarouselView(index: $currentIndex, cardPadding: 100, items: roomImages, id: \.id) {roomImage, cardSize in
                    Image(roomImage.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: cardSize.width, height: cardSize.height)
                        .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                }
                .padding(.horizontal, -15)
                .padding(.vertical)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(addressLabel)
                                .bold()
                            
                            Text(address)
                        }
                        
                        HStack {
                            Text(geoLocationLabel)
                                .bold()
                            
                            Button(action: {
                                isTooltipAlertShown = !isTooltipAlertShown
                            }) {
                                Image(systemName: "info.circle")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                            .padding(.leading, -2)
                            .padding(.trailing, 5)
                            .alert(tooltipText, isPresented: $isTooltipAlertShown) {
                                Button("OK", role: .cancel) {}
                            }
                            
                            Text(String(geoWidth) + ", " + String(geoLength))
                                .onTapGesture {
                                    self.openLocationOnMap(width: self.geoWidth, length: self.geoLength)
                                }
                        }
                        
                        HStack {
                            Text(roomTypeLabel)
                                .bold()
                            
                            switch roomType {
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
                            
                            switch currency {
                            case .HUF:
                                Text(String(Int(price.rounded())) + " Ft")
                            case .EUR:
                                Text("€"+String(price))
                            case .USD:
                                Text("$"+String(price))
                            }
                        }
                        
                        HStack(alignment: .top) {
                            Text(acceptedPaymentMethodsLabel)
                                .bold()
                            
                            VStack(alignment: .leading, spacing: 1) {
                                ForEach(0..<acceptedPaymentMethods.count) {
                                    switch acceptedPaymentMethods[$0] {
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
                            Text(maxGuestNumLabel)
                                .bold()
                            
                            Text(String(maxGuestNum) + " fő")
                        }
                        
                        HStack {
                            Text(smokingLabel)
                                .bold()
                            
                            nonSmoking ? Text("❌") : Text("✅")
                        }
                        
                        HStack {
                            Text(petFriendlyLabel)
                                .bold()
                            
                            petFriendly ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(airConditionerLabel)
                                .bold()
                            
                            airConditioner ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(parkingLabel)
                                .bold()
                            
                            parking ? Text("✅") : Text("❌")
                        }
                        
                        HStack {
                            Text(bicycleStorageLabel)
                                .bold()
                            
                            bicycleStorage ? Text("✅") : Text("❌")
                        }
                        
                        HStack(alignment: .top) {
                            Text(additionalInfoLabel)
                                .bold()
                            
                            Text(additionalInfo)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 8)
                
                // TODO: navigation to the confirmation form
                NavigationLink(destination: ProfileView()) {
                    Text(bookButtonLabel)
                }
                .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
            }
            .padding([.horizontal, .top], 15)
        }
    }
    
    private func openLocationOnMap(width: Float, length: Float) {
        let latitude: CLLocationDegrees = Double(width)
        let longitude: CLLocationDegrees = Double(length)
        let regionDistance: CLLocationDistance = 10000
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "Couch"
        mapItem.openInMaps(launchOptions: options)
    }
}

#Preview {
    AccommDetailsVeiw()
}
