//
//  SectionWithSelectableListItemsView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 07. 27..
//

import SwiftUI

struct SectionWithSelectableListItemsView<H: View>: View {
    @State var listItems: [ListItem]
    var header: H
    
    init(listItems: [ListItem], header: H) {
        self.listItems = listItems
        self.header = header
    }
    
    var body: some View {
        Section {
            List {
                ForEach(0..<listItems.count, id: \.self) {index in
                    Button(action: {
                        listItems[index].isSelected = listItems[index].isSelected ? false : true
                    }) {
                        ListItemSelectedView(listItem: listItems[index])
                    }
                    .foregroundColor(.black)
                }
            }
        } header: {
            header
        }
    }
}

#Preview {
    SectionWithSelectableListItemsView(listItems: [], header: Text("Header"))
}
