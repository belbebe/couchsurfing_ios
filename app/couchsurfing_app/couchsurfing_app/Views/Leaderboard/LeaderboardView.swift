//
//  LeaderboardView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 27..
//

import SwiftUI

struct LeaderboardView: View {
    private let nav_title = "Ranglista"
    private let picker_label = ""
    private let picker_texts = ["Foglalók", "Kiadók"]
    
    // TODO: use leaderbord data fetched from the BE
    @State private var picker_state = "Foglalók"
    @StateObject private var viewModel = LeaderboardViewModel(
        data: LeaderboardViewModel.Data(
            renters: [
                UserLeaderboardInfo(name_text: "Minta Béla", score: 1530),
                UserLeaderboardInfo(name_text: "Minta József", score: 1000),
                UserLeaderboardInfo(name_text: "Példa Eszter", score: 1670),
                UserLeaderboardInfo(name_text: "Pl Ubul", score: 890)
            ],
            owners: [
                UserLeaderboardInfo(name_text: "Minta Béla", score: 900),
                UserLeaderboardInfo(name_text: "Példa Eszter", score: 2340),
                UserLeaderboardInfo(name_text: "Minta József", score: 1100),
                UserLeaderboardInfo(name_text: "Pl Ubul", score: 500)
            ]
        )
    )
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(CouchSurfingCustomColor.buttonBackground)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                LeaderboardPickerView(viewModel: viewModel)
                
                if viewModel.data.pickerState == LeaderboardPickerView.Options.renters.rawValue {
                    LeaderboardListView(leaderBoardInfo: viewModel.data.renters)
                } else {
                    LeaderboardListView(leaderBoardInfo: viewModel.data.owners)
                }
            }
            .navigationTitle(nav_title)
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}

extension Sequence {
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        sorted { a, b in
            a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}
