//
//  BookingFormViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 21..
//

import Foundation
import SwiftData
import SwiftUI

@MainActor
public class BookingFormViewModel: ObservableObject {
//    @Environment(\.modelContext) var modelContext
//    @Query var rooms: [RoomModel]
    
//    @Published var navigationPath = NavigationPath()
    
    @Published var data = Data()
    
    /*
    func fetchRooms() async {
        // TODO: bejelentkezés kezelés után user id-t helyettesíteni be
        /*
         guard let encodedRequestData = try? JSONEncoder().encode(AccommodationRequest(city: booking_city, startDate: stay_start_date, endDate: stay_end_date, paymentMethod: getPaymentMethodArray(), priceFrom: preferred_price_range_from_toggle ? price_from : nil, priceTo: preferred_price_range_to_toggle ? price_to : nil, currency: (preferred_price_range_from_toggle || preferred_price_range_to_toggle) ? preferred_price_currency : nil, ratingFrom: preferred_rating_range_from ? rating_from : nil, ratingTo: preferred_rating_range_to ? rating_to : nil, nonSmoking: other_needs[0].is_selected, petFriendly: other_needs[1].is_selected, airConditioner: other_needs[2].is_selected, parking: other_needs[3].is_selected, bicycleStorage: other_needs[4].is_selected, tenantId: 1)) else {
         print("Failed to encode data.")
         return
         }
         */
        
        let date_formatter = DateFormatter()
        date_formatter.dateFormat = "yyyy-MM-dd"
        
        // MARK: building the url
        guard var url = URL(string: "http://localhost:8080/api/room") else { print("Invalid URL"); return }
        url.append(queryItems: [
            URLQueryItem(name: "city", value: booking_city),
            URLQueryItem(name: "startDate", value: date_formatter.string(from: stay_start_date)),
            URLQueryItem(name: "endDate", value: date_formatter.string(from: stay_end_date)),
            URLQueryItem(name: "nonSmoking", value: String(other_needs[0].is_selected)),
            URLQueryItem(name: "petFriendly", value: String(other_needs[1].is_selected)),
            URLQueryItem(name: "airConditioner", value: String(other_needs[2].is_selected)),
            URLQueryItem(name: "parking", value: String(other_needs[3].is_selected)),
            URLQueryItem(name: "bicycleStorage", value: String(other_needs[4].is_selected)),
            URLQueryItem(name: "tenantId", value: String(1)),
        ])
        
        for i in payment_methods {
            if (i.is_selected) {
                if (i.name == "Készpénz") {
                    url.append(queryItems: [URLQueryItem(name: "paymentMethod", value: "CASH")])
                } else {
                    url.append(queryItems: [URLQueryItem(name: "paymentMethod", value: "CARD")])
                }
            }
        }
        
        if (preferred_price_range_from_toggle) {
            url.append(queryItems: [URLQueryItem(name: "priceFrom", value: String(price_from))])
        }
        
        if (preferred_price_range_to_toggle) {
            url.append(queryItems: [URLQueryItem(name: "priceTo", value: String(price_to))])
        }
        
        if (preferred_price_range_from_toggle || preferred_price_range_to_toggle) {
            url.append(queryItems: [URLQueryItem(name: "currency", value: preferred_price_currency == .HUF ? "HUF" : preferred_price_currency == .EUR ? "EUR" : "USD")])
        }
        
        if (preferred_rating_range_from) {
            url.append(queryItems: [URLQueryItem(name: "ratingFrom", value: String(rating_from))])
        }
        
        if (preferred_rating_range_to) {
            url.append(queryItems: [URLQueryItem(name: "ratingTo", value: String(rating_to))])
        }
        
        // MARK: building the request
        var request = URLRequest(url: url)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let decoded_response = try? JSONDecoder().decode([RoomModel].self, from: data) {
                print("The response body is: ", decoded_response.self)
            } else {
                print("error in decoding")
            }
            //print("HTTP URL response: ", response)
            //print("The response body is: ", rooms[0])
        } catch {
            print("Invalid data")
        }
        
        /*
         request.httpBody = encodedRequestData
         
         let task = URLSession.shared.dataTask(with: request) { data, response, error in
         guard let data = data, error == nil else {
         print(error?.localizedDescription ?? "No data.")
         return
         }
         
         /*
          if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
          // check for http errors
          print("statusCode should be 200, but is \(httpStatus.statusCode)")
          print("response = \(response)")
          }
          */
         
         let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
         if let responseJSON = responseJSON as? [String: Any] {
         print(responseJSON)
         }
         }
         */
    }
    
    private func deleteRooms() {
        do {
            try modelContext.delete(model: RoomModel.self)
            try modelContext.save()
        } catch {
            print("Failed to delete all rooms.")
        }
    }
    
    private func getPaymentMethodArray() -> [PaymentMethod] {
        var payment_methods_array = [PaymentMethod]()
        
        if(payment_methods[0].is_selected) {
            payment_methods_array.append(.CASH)
        }
        
        if(payment_methods[1].is_selected) {
            payment_methods_array.append(.CARD)
        }
        
        return payment_methods_array
    }
     */
}

// MARK: - Data
extension BookingFormViewModel {
    public class Data {
        var paymentMethods = [
            ListItem(name: "Készpénz"),
            ListItem(name: "Bankkártya"),
            //ListItem(name: "Ház körüli munka elfogadott")
        ]
        
        var otherNeeds = [
            ListItem(name: "Nem-dohányzó"),
            ListItem(name: "Állatbarát"),
            ListItem(name: "Légkondíciónáló"),
            ListItem(name: "Parkolóhely biztsoított"),
            ListItem(name: "Bicikli tárolás biztosított")
        ]
        
        var bookingCity = ""
        var stayStartDate = Date()
        var stayEndDate = Date()
        var selectedPaymentMethod = "Készpénz"
        
        var preferredPriceCurrency: Currency = .HUF
        var preferredPriceRangeFrom = false {
            didSet {
                if preferredPriceRangeFrom == false {
                    priceFrom = 0
                }
            }
        }
        var preferredPriceRangeTo = false {
            didSet {
                if preferredPriceRangeFrom == false {
                    priceTo = 0
                }
            }
        }
        var priceFrom: Int = 0
        var priceTo: Int = 0
        var priceCurrencyPickerValues: [Currency] = [.HUF, .EUR, .USD]
        
        var preferredRatingRangeFrom = false {
            didSet {
                if preferredRatingRangeFrom == false {
                    ratingFrom = 0.0
                }
            }
        }
        var preferredRatingRangeTo = false {
            didSet {
                if preferredRatingRangeTo == false {
                    ratingTo = 0.0
                }
            }
        }
        var ratingFrom: Float = 0.0
        var ratingTo: Float = 0.0
        
        var otherNeedsSelections = Set<UUID>()
    }
}
