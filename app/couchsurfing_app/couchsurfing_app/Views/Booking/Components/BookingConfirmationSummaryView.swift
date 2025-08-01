//
//  BookingConfirmationSummaryView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 01..
//

import SwiftUI

struct BookingConfirmationSummaryView: View {
    let stayStartLabel: String
    let stayEndLabel: String
    let paymentMethodLabel: String
    let pricePerNightLabel: String
    let paymentWithChoresSectionHeader: String
    let guestNumberLabel: String
    let additionalNotesLabel: String
    
    let dateFormatter = DateFormatter()
    
    @ObservedObject var viewModel: BookingConfirmationViewModel
    
    init(
        stayStartLabel: String,
        stayEndLabel: String,
        paymentMethodLabel: String,
        pricePerNightLabel: String,
        paymentWithChoresSectionHeader: String,
        guestNumberLabel: String,
        additionalNotesLabel: String,
        viewModel: BookingConfirmationViewModel
    ) {
        self.stayStartLabel = stayStartLabel
        self.stayEndLabel = stayEndLabel
        self.paymentMethodLabel = paymentMethodLabel
        self.pricePerNightLabel = pricePerNightLabel
        self.paymentWithChoresSectionHeader = paymentWithChoresSectionHeader
        self.guestNumberLabel = guestNumberLabel
        self.additionalNotesLabel = additionalNotesLabel
        self.viewModel = viewModel
        
        dateFormatter.dateFormat = "d MMM y"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(stayStartLabel):")
                    .bold()
                
                Text(dateFormatter.string(from: viewModel.data.stayStartDate))
            }
            
            HStack {
                Text("\(stayEndLabel):")
                    .bold()
                
                Text(dateFormatter.string(from: viewModel.data.stayEndDate))
            }
            
            HStack {
                Text("\(paymentMethodLabel):")
                    .bold()
                
                Text(viewModel.mapPaymentMethodToText(paymentMethod: viewModel.data.selectedPaymentMethod))
            }
            
            HStack {
                Text("\(pricePerNightLabel):")
                    .bold()
                
                Text(viewModel.mapPriceToText())
            }
            
            HStack (alignment: .bottom) {
                Text(paymentWithChoresSectionHeader + ": \(viewModel.data.payWithChores[0].isSelected ? "✅" : "❌")")
                    .bold()
            }
            
            HStack {
                Text("\(guestNumberLabel):")
                    .bold()
                
                Text(String(viewModel.data.guestNumber))
            }
            
            if viewModel.data.additionalNotesValue != "" {
                HStack (alignment: .top) {
                    Text("\(additionalNotesLabel):")
                        .bold()
                    
                    Text(String(viewModel.data.additionalNotesValue))
                }
            }
        }
        .padding(EdgeInsets(top: 8.0, leading: .zero, bottom: 8.0, trailing: .zero))
    }
}

//#Preview {
//    BookingConfirmationSummaryView()
//}
