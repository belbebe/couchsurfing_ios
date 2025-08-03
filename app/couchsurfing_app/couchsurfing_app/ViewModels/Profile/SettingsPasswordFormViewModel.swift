//
//  SettingsPasswordFormViewModel.swift
//  couchsurfing_app
//
//  Created by Belcsik Bence on 2025. 08. 03..
//

import Foundation
import SwiftUI

@MainActor
public class SettingsPasswordFormViewModel: ObservableObject {
    @Published var data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    func modifyPasswordButtonTapListener() {
        data.isNewPasswordNotMatchingDialogShown = data.newPasswordValue != ""
        && data.newPasswordValue != data.newPasswordConfirmationValue
        
        data.isNewPasswordEmptyDialogShown = data.newPasswordValue == ""
        
        data.isOldPasswordEmptyDialogShown = data.oldPasswordValue == ""
        
        data.isOldPasswordNotMatchingDialogShown = data.oldPasswordValue != data.oldPassword
        
        if !data.isNewPasswordNotMatchingDialogShown,
           !data.isNewPasswordEmptyDialogShown,
           !data.isOldPasswordNotMatchingDialogShown,
           !data.isOldPasswordEmptyDialogShown {
            // TODO: update password endpoint invocation
        }
    }
}

// MARK: - Data
extension SettingsPasswordFormViewModel {
    public class Data {
        let oldPassword: String
        var oldPasswordValue: String
        var newPasswordValue: String
        var newPasswordConfirmationValue: String
        var isNewPasswordNotMatchingDialogShown: Bool
        var isNewPasswordEmptyDialogShown: Bool
        var isOldPasswordEmptyDialogShown: Bool
        var isOldPasswordNotMatchingDialogShown: Bool
        
        init(oldPassword: String,
             oldPasswordValue: String = "",
             newPasswordValue: String = "",
             newPasswordConfirmationValue: String = "",
             isNewPasswordNotMatchingDialogShown: Bool = false,
             isNewPasswordEmptyDialogShown: Bool = false,
             isOldPasswordEmptyDialogShown: Bool = false,
             isOldPasswordNotMatchingDialogShown: Bool = false
        ) {
            self.oldPassword = oldPassword
            self.oldPasswordValue = oldPasswordValue
            self.newPasswordValue = newPasswordValue
            self.newPasswordConfirmationValue = newPasswordConfirmationValue
            self.isNewPasswordNotMatchingDialogShown = isNewPasswordNotMatchingDialogShown
            self.isNewPasswordEmptyDialogShown = isNewPasswordEmptyDialogShown
            self.isOldPasswordEmptyDialogShown = isOldPasswordEmptyDialogShown
            self.isOldPasswordNotMatchingDialogShown = isOldPasswordNotMatchingDialogShown
        }
    }
}
