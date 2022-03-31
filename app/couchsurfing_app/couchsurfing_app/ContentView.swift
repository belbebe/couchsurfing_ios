//
//  ContentView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 03..
//

import SwiftUI
import Combine

struct ContentView: View {
    
    var body: some View {
        //TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
        TabView {
            // "Foglalás" tab
            BookingView()
                .tabItem {
                    Label("Foglalás", systemImage: "calendar")
                }
            // "Szoba kiadása" tab
            RentView()
                .tabItem {
                    Label("Szoba kiadása", systemImage: "house")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
