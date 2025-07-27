//
//  OtherNeedListItemView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 20..
//

import SwiftUI

struct ListItemSelectedView: View {
    let listItem: ListItem
    
    var body: some View {
        HStack {
            if(listItem.isSelected) {
                Image(systemName: "checkmark")
                    .foregroundColor(.orange)
            }
            Text(listItem.name)
            Spacer()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemSelectedView(listItem: ListItem(name: "pelda", isSelected: true))
    }
}


