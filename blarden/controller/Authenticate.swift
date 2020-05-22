//
//  Authenticate.swift
//  blarden
//
//  Created by Rafael Almeida on 22/05/2020.
//  Copyright © 2020 Rafael Almeida. All rights reserved.
//

import Foundation
import LocalAuthentication

func authenticate(authenticateOpencompletitionHandler: @escaping (Bool) -> ()) {
    let context = LAContext()

    context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: NSLocalizedString("Please authenticate to proceed", comment: "")) { success, error in
        DispatchQueue.main.async {
            if success {
                authenticateOpencompletitionHandler(true)
            } else {
                print(error?.localizedDescription ?? "Failed to authenticate")
                authenticateOpencompletitionHandler(false)
            }
        }
    }
}
