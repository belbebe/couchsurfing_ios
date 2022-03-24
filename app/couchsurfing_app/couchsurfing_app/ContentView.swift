//
//  ContentView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 03..
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    
    @State private var foglalas_varos: String = ""
    @State private var foglalas_kezdete = Date()
    @State private var foglalas_vege = Date()
    @State private var fizetes_modja = 1
    @State private var ar_tol = "0"
    @State private var ar_ig = "0"
    @State private var ertekeles_tol = "0"
    @State private var ertekeles_ig = "0"
    @State private var egyeb_igeny = [
        EgyebIgeny(name: "Nem-dohányzó"),
        EgyebIgeny(name: "Állatbarát"),
        EgyebIgeny(name: "Légkondíciónáló"),
        EgyebIgeny(name: "Parkolóhely biztsoított"),
        EgyebIgeny(name: "Bicikli tárolás biztosított")
    ]
    //@State private var egyeb_igeny_items: [String] = ["Nem-dohányzó", "Állatbarát", "Légkondícionáló", "Parkolóhely biztosított"]
    //@State private var egyeb_igeny_selections: [String] = []
    @State private var egyeb_igeny_selections = Set<UUID>()
    
    private struct EgyebIgeny: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }
    
    var body: some View {
        //TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
        TabView {
            // "Foglalás" tab
            NavigationView {
                ScrollView {
                    VStack(spacing: 30) {
                        Text("Foglalás")
                            .font(.system(size: 40, weight: .bold))
                        
                        TextField("Város", text: $foglalas_varos)
                            .frame(width: 300, height: 30, alignment: .center)
                        
                        HStack(spacing: 50) {
                            VStack {
                                Text("Tartózkodás kezdete")
                                    .font(.system(size: 14, weight: .bold))
                                DatePicker("Tartózkodás kezdete", selection: $foglalas_kezdete, displayedComponents: [.date])
                                    .frame(width: 125, height: 30, alignment: .center)
                            }
                            VStack {
                                Text("Tartózkodás vége")
                                    .font(.system(size: 14, weight: .bold))
                                DatePicker("Tartózkodás kezdete", selection: $foglalas_vege, displayedComponents: [.date])
                                    .frame(width: 125, height: 30, alignment: .center)
                            }
                        }
                        
                        Text("Fizetés módja")
                            .font(.system(size: 14, weight: .bold))
                        
                        Picker(selection: $fizetes_modja, label: Text("Fizetés módja")) {
                            Text("Bankkártya").tag(1)
                            Text("Készpénz").tag(2)
                            Text("Ellenszolgáltatás").tag(3)
                        }
                        
                        Text("Preferált árkategória")
                            .font(.system(size: 14, weight: .bold))
                        
                        HStack(spacing: 50) {
                            VStack {
                                Text("-tól")
                                    .font(.system(size: 12))
                                TextField("0", text: $ar_tol)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(ar_tol)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.ar_tol = filtered
                                        }
                                    }
                            }
                            VStack {
                                Text("-ig")
                                    .font(.system(size: 12))
                                TextField("0", text: $ar_ig)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(ar_ig)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.ar_ig = filtered
                                        }
                                    }
                            }
                        }
                        
                        Text("Preferált értékelés")
                            .font(.system(size: 14, weight: .bold))
                        
                        HStack(spacing: 50) {
                            VStack {
                                Text("-tól")
                                    .font(.system(size: 12))
                                TextField("0", text: $ertekeles_tol)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(ertekeles_tol)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.ertekeles_tol = filtered
                                        }
                                    }
                            }
                            VStack {
                                Text("-ig")
                                    .font(.system(size: 12))
                                TextField("0", text: $ertekeles_ig)
                                    .keyboardType(.numberPad)
                                    .onReceive(Just(ertekeles_ig)) { newValue in
                                        let filtered = newValue.filter { "0123456789".contains($0) }
                                        if filtered != newValue {
                                            self.ertekeles_ig = filtered
                                            print("\(self.ertekeles_ig)")
                                        }
                                    }
                            }
                        }
                        
                        Group {
                            Text("Egyéb igények")
                                .font(.system(size: 14, weight: .bold))
                            
                            List(egyeb_igeny, selection: $egyeb_igeny_selections) {
                                Text($0.name)
                            }
                            .frame(minHeight: minRowHeight * 3)
                            .toolbar {EditButton()}
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                Text("Keresés")
                            }
                            .border(.blue)
                        }
                    }
                }
            }
            .tabItem { VStack {
                Text("Foglalás")
                Image(systemName: "calendar")
            } }.tag(1)
            
            
            // "Szoba kiadása" tab
            NavigationView {
                ScrollView {
                    
                }
            }
            .tabItem {
                VStack {
                    Label("Szoba kiadása", systemImage: "house")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
