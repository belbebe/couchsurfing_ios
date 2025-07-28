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
    public class Data {
        var paymentMethods = [
            ListItem(name: "Készpénz"),
            ListItem(name: "Bankkártya"),
            ListItem(name: "Ellenszolgáltatás")
        ]
        
        var otherNeeds = [
            ListItem(name: "Nem-dohányzó"),
            ListItem(name: "Állatbarát"),
            ListItem(name: "Légkondíciónáló"),
            ListItem(name: "Parkolóhely biztsoított"),
            ListItem(name: "Bicikli tárolás biztosított")
        ]
        
        var rentCity: String = ""
        var rentPostalCode: String = ""
        var rentStreet: String = ""
        var rentLatitude:  String = ""
        var rentLongitude: String = ""
        var accomodationTypes = ["Apartman", "Szoba", "Kanapé"]
        var selectedAccomodationType = "Apartman"
        var pricePerNight = 0.0
    }
}
