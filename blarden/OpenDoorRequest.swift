//
//  OpenDoorRequest.swift
//  blarden
//
//  Created by Rafael Almeida on 13/10/2019.
//  Copyright © 2019 Rafael Almeida. All rights reserved.
//

import Combine
import SwiftUI

class OpenDoorRequest  {
    let baseUrl = "https://blarden.herokuapp.com"
    
    func requestDoorOpen() -> Bool {
        let url = URL(string: "\(baseUrl)/open-door")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("data: \(dataString)")
                }
            }
        }
        
        task.resume()
        
        return true
    }
}
