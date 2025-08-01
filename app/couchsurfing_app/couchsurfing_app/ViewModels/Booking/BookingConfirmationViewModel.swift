//
//  BookingConfirmationViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 30..
//

import Foundation
import MapKit
import SwiftData
import SwiftUI

@MainActor
public class BookingConfirmationViewModel: ObservableObject {
    @Published var data = Data(
        stayStartDate: Date(),
        stayEndDate: Date(),
        guestNumber: 1,
        selectedPaymentMethod: .CASH
    )
    
    func mapPaymentMethodToText(paymentMethod: PaymentMethod) -> String {
        switch paymentMethod {
        case .CARD:
            "Bankkártya"
        case .CASH:
            "Készpénz"
        case .CHORE:
            "Ellenszolgáltatás"
        }
    }

    func mapPriceToText() -> String {
        if data.isPaymentWithChoresAccepted,
           let priceWithChores = data.priceWithChores,
           let payWithChoresItem = data.payWithChores.first,
           payWithChoresItem.isSelected {
            switch data.currency {
            case .HUF:
                return "\(Int(priceWithChores.rounded())) Ft"
            case .EUR:
                return "€\(priceWithChores)"
            case .USD:
                return "$\(priceWithChores)"
            }
        }
        
        switch data.currency {
        case .HUF:
            return "\(Int(data.price.rounded())) Ft"
        case .EUR:
            return "€\(data.price)"
        case .USD:
            return "$\(data.price)"
        }
    }
}

// MARK: - Data
extension BookingConfirmationViewModel {
    // MARK: - booking properties - partly from the search conditions, partly from room data
    public class Data {
        let searchStartDateFrom: Date = Date()
        let searchEndDateFrom: Date = Date()
        let maxGuestNumber: Int = 3
        let isPaymentWithChoresAccepted: Bool = true
        let price: Float = 10000.0
        let priceWithChores: Float? = 7500.0
        let currency: Currency = .HUF
        let acceptedPaymentMethods: [PaymentMethod] = [.CASH, .CARD]
        
        // TODO: add Accommodation property with navigation
        
        var stayStartDate: Date
        var stayEndDate: Date
        var guestNumber: Int
        var selectedPaymentMethod: PaymentMethod
        var payWithChores: [ListItem]
        let additionalNotesLabel: String = "Egyéb megjegyzések..."
        var additionalNotesValue: String = ""
        var isChoresTooltipAlertShown = false
        
        init(
            stayStartDate: Date,
            stayEndDate: Date,
            guestNumber: Int,
            selectedPaymentMethod: PaymentMethod,
            payWithChores: [ListItem]  = [
                ListItem(name: "Elfogadom")
            ]
        ) {
            self.stayStartDate = stayStartDate
            self.stayEndDate = stayEndDate
            self.guestNumber = guestNumber
            self.selectedPaymentMethod = selectedPaymentMethod
            self.payWithChores = payWithChores
        }
    }
}
