//
//  ContentView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 03. 03..
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var foglalas_varos: String = ""
    @State private var foglalas_kezdete = Date()
    @State private var foglalas_vege = Date()
    @State private var fizetes_modja = 1
    @State private var ar_tol = "0"
    @State private var ar_ig = "0"
    @State private var ertekeles_tol = "0"
    @State private var ertekeles_ig = "0"
    @State private var egyeb_igeny_items: [String] = ["Nem-dohányzó", "Állatbarát", "Légkondícionáló", "Parkolóhely biztosított"]
    @State private var egyeb_igeny_selections: [String] = []
    
    var body: some View {
        //TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
        TabView {
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
                        TextField("-tól", text: $ar_tol)
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
                        TextField("-ig", text: $ar_ig)
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
                        TextField("-tól", text: $ertekeles_tol)
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
                        TextField("-ig", text: $ertekeles_ig)
                            .keyboardType(.numberPad)
                            .onReceive(Just(ertekeles_ig)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.ertekeles_ig = filtered
                                }
                            }
                    }
                }
                
                Text("Egyéb igények")
                    .font(.system(size: 14, weight: .bold))
                
                /*
                List {
                    ForEach(self.egyeb_igeny_items, id: \.self) { item in
                        MultipleSelectionRow(title: item, isSelected: self.egyeb_igeny_selections.contains(item)) {
                            if self.egyeb_igeny_selections.contains(item) {
                                self.egyeb_igeny_selections.removeAll(where: { $0 == item })
                            }
                            else {
                                self.egyeb_igeny_selections.append(item)
                            }
                        }
                    }
                }
                */
                
            }
            .tabItem { VStack {
                Text("Foglalás")
                Image(systemName: "calendar")
            } }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
