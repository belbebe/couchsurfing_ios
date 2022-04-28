//
//  ContentView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 03..
//

import SwiftUI
import Combine

struct ContentView: View {
    private let booking_tab_text: String = "Foglalás"
    private let renting_tab_text: String = "Szoba kiadása"
    private let profile_tab_text: String = "Profil"
    private let leaderboard_tab_text: String = "Ranglista"
    
    var body: some View {
        //TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
        TabView {
            // "Foglalás" tab
            //BookingView()
            BookingViewForm()
                .tabItem {
                    Label(booking_tab_text, systemImage: "calendar")
                }
            // "Szoba kiadása" tab
            RentViewForm()
                .tabItem {
                    Label(renting_tab_text, systemImage: "house")
                }
            
            // "Ranglista" tab
            LeaderboardView()
                .tabItem() {
                    Label(leaderboard_tab_text, systemImage: "list.number")
                }
            
            // "Profil" tab
            ProfileView()
                .tabItem() {
                    Label(profile_tab_text, systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
