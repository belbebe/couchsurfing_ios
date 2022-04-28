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
    
    @State private var example_renters = [
        UserLeaderboardInfo(name_text: "Minta Béla", score: 1530),
        UserLeaderboardInfo(name_text: "Minta József", score: 1000),
        UserLeaderboardInfo(name_text: "Példa Eszter", score: 1670),
        UserLeaderboardInfo(name_text: "Pl Ubul", score: 890)
    ]
    @State private var example_owners = [
        UserLeaderboardInfo(name_text: "Minta Béla", score: 900),
        UserLeaderboardInfo(name_text: "Példa Eszter", score: 2340),
        UserLeaderboardInfo(name_text: "Minta József", score: 1100),
        UserLeaderboardInfo(name_text: "Pl Ubul", score: 500)
    ]
    @State private var picker_state = "Foglalók"
    
    var body: some View {
        NavigationView {
            VStack {
                // leaderboard selection
                Picker(picker_label, selection: $picker_state) {
                    ForEach(picker_texts, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                if(picker_state == "Foglalók") {
                    List {
                        ForEach(0..<example_renters.count) { index in
                            UserLeaderboardView(user_info: example_renters[index])
                        }
                    }
                    .listStyle(.grouped)
                } else if(picker_state == "Kiadók") {
                    List {
                        ForEach(0..<example_owners.count) { index in
                            UserLeaderboardView(user_info: example_owners[index])
                        }
                    }
                    .listStyle(.grouped)
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

/*
 if(picker_state == "Foglalók") {
     example_renters = example_renters.sorted(by: \.score)
     ForEach(0..<example_renters.count) { index in
         UserLeaderboardView(example_renters[index])
     }
 } else {
     example_owners = example_owners.sorted(by: \.score)
     ForEach(example_owners) {
         $0
     }
 }
 */
