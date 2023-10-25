//
//  AccommDetailsVeiw.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 24/10/2023.
//

import SwiftUI

struct AccommDetailsVeiw: View {
    // TODO: create Model object for the room data
    let address: String = "Budapest, Fő utca 1."
    let geoLength: Float = 19.046716
    let geoWidth: Float = 47.500952
    let roomType: AccomTypeEnum = AccomTypeEnum.room
    let price: Float = 10000.0
    let currency: Currency = .HUF
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
    
    //MARK: labels
    let addressLabel: String = "Cím:"
    let geoLocationLabel: String = "Földrajzi helyzet:"
    let roomTypeLabel: String = "Szállás típusa:"
    let roomTypeApartmentLabel: String = "Apartman"
    let roomTypeCouchLabel: String = "Kanapé"
    let roomTypeRoomLabel: String = "Szoba"
    let pricePerNightLabel: String = "Ár éjszakánként:"
    let maxGuestNumLabel: String = "Maximális vendégszám:"
    let smokingLabel: String = "Dohányzó:"
    let petFriendlyLabel: String = "Kisállatbarát:"
    let airConditionerLabel: String = "Légkondícionáló:"
    let parkingLabel: String = "Parkolás:"
    let bicycleStorageLabel: String = "Biciklitároló:"
    let additionalInfoLabel: String = "Egyéb:"
    let bookButtonLabel: String = "Lefoglalom"
    
    
    var body: some View {
        ScrollView {
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
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(addressLabel)
                            .bold()
                        
                        Text(address)
                    }
                    
                    HStack {
                        Text(geoLocationLabel)
                            .bold()
                        
                        Text(String(geoWidth))
                        
                        Text(String(geoLength))
                        // TODO: onTapGesture open Maps
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
                    
                    HStack {
                        Text(maxGuestNumLabel)
                            .bold()
                        
                        Text(String(maxGuestNum) + " fő")
                    }
                    
                    HStack {
                        Text(smokingLabel)
                            .bold()
                        
                        if(nonSmoking) {
                            Text("❌")
                        } else {
                            Text("✅")
                        }
                    }
                    
                    HStack {
                        Text(petFriendlyLabel)
                            .bold()
                        
                        if(petFriendly) {
                            Text("✅")
                        } else {
                            Text("❌")
                        }
                    }
                    
                    HStack {
                        Text(airConditionerLabel)
                            .bold()
                        
                        if(airConditioner) {
                            Text("✅")
                        } else {
                            Text("❌")
                        }
                    }
                    
                    HStack {
                        Text(parkingLabel)
                            .bold()
                        
                        if(parking) {
                            Text("✅")
                        } else {
                            Text("❌")
                        }
                    }
                    
                    HStack {
                        Text(bicycleStorageLabel)
                            .bold()
                        
                        if(bicycleStorage) {
                            Text("✅")
                        } else {
                            Text("❌")
                        }
                    }
                    
                    HStack(alignment: .top) {
                        Text(additionalInfoLabel)
                            .bold()
                        
                        Text(additionalInfo)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {}) {
                    Text(bookButtonLabel)
                }
                .modifier(ButtonDesignModifier(color: CouchSurfingCustomColor.buttonBackground, background: CouchSurfingCustomColor.baseColor))
            }
            .padding([.horizontal, .top], 15)
                 
        }
    }
}

#Preview {
    AccommDetailsVeiw()
}
