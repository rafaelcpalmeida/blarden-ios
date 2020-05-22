//
//  Button.swift
//  blarden
//
//  Created by Rafael Almeida on 20/05/2020.
//  Copyright © 2020 Rafael Almeida. All rights reserved.
//

import Foundation

struct BlardenButton: Identifiable {
    let id: Int
    
    let name: String
    var status: BlardenButtonStatus
}

enum BlardenButtonStatus {
    case requestingState
    case okState
    case errorState
    case defaultState
}
