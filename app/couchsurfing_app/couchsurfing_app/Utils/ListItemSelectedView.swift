//
//  OtherNeedListItemView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 20..
//

import SwiftUI

struct ListItemSelectedView: View {
    let list_item: ListItem
    
    var body: some View {
        HStack {
            if(list_item.is_selected) {
                Image(systemName: "checkmark")
                    .foregroundColor(.orange)
            }
            Text(list_item.name)
            Spacer()
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemSelectedView(list_item: ListItem(name: "pelda", is_selected: true))
    }
}


