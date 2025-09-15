//
//  LeaderboardPickerView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 01..
//

import SwiftUI

struct LeaderboardPickerView: View {
    private let pickerOptions = Options.allCases
    @ObservedObject var viewModel: LeaderboardViewModel
    
    var body: some View {
        Picker("", selection: $viewModel.data.pickerState) {
            ForEach(
                pickerOptions.map({ (option: Options) -> String in
                    option.rawValue
                }),
                id: \.self) {
                    Text($0)
                        .background(CouchSurfingCustomColor.buttonBackground)
                }
        }
        .pickerStyle(.segmented)
        .padding()
    }
}

// MARK: - Options
extension LeaderboardPickerView {
    enum Options: String, CaseIterable, Identifiable {
        case renters = "Foglalók"
        case owners = "Kiadók"
        var id: Self { self }
    }
}

#Preview {
    LeaderboardPickerView(viewModel: LeaderboardViewModel(data: .init(renters: [], owners: [])))
}
