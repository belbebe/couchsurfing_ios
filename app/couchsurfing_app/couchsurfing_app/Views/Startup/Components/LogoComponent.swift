//
//  LogoComponent.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 19..
//

import SwiftUI

struct LogoComponent: View {
    var body: some View {
        Image(Constants.imageAssetName, label: Text(Constants.imageLabel))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(alignment: .top)
    }
}

// MARK: - Constants
private extension LogoComponent {
    enum Constants {
        static let imageAssetName = "Couchsurfing app - Logo"
        static let imageLabel = "Logo"
    }
}

#Preview {
    LogoComponent()
}
