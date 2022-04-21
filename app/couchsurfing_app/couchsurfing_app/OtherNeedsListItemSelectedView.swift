//
//  OtherNeedListItemView.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2022. 04. 20..
//

import SwiftUI

struct OtherNeedsListItemSelectedView: View {
    let other_need: OtherNeed
    
    var body: some View {
        HStack {
            if(other_need.is_selected) {
                Image(systemName: "checkmark")
                    .foregroundColor(.orange)
            }
            Text(other_need.name)
            Spacer()
        }
    }
}

struct OtherNeedListItemView_Previews: PreviewProvider {
    static var previews: some View {
        OtherNeedsListItemSelectedView(other_need: OtherNeed(name: "pelda", is_selected: true))
    }
}


