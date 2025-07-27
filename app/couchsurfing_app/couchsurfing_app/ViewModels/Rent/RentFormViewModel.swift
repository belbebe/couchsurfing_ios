//
//  RentFormViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 27..
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
public class RentFormViewModel: ObservableObject {
    @Published var data = Data()
}

// MARK: - Data
extension RentFormViewModel {
    public class Data: ObservableObject {
        @State var paymentMethods = [
            ListItem(name: "Készpénz"),
            ListItem(name: "Bankkártya"),
            ListItem(name: "Ellenszolgáltatás")
        ]
        
        @State var otherNeeds = [
            ListItem(name: "Nem-dohányzó"),
            ListItem(name: "Állatbarát"),
            ListItem(name: "Légkondíciónáló"),
            ListItem(name: "Parkolóhely biztsoított"),
            ListItem(name: "Bicikli tárolás biztosított")
        ]
        
        @State var rentCity: String = ""
        @State var rentPostalCode: String = ""
        @State var rentStreet: String = ""
        @State var rentLatitude:  String = ""
        @State var rentLongitude: String = ""
        @State var accomodationTypes = ["Apartman", "Szoba", "Kanapé"]
        @State var selectedAccomodationType = "Apartman"
        @State var pricePerNight = 0.0
    }
}
