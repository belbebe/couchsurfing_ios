//
//  ContentView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 03..
//

import SwiftUI
import Combine

struct ContentView: View {
    private var booking_tab_text: String = "Foglalás"
    private var renting_tab_text: String = "Szoba kiadása"
    private var profile_tab_text: String = "Profil"
    
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
