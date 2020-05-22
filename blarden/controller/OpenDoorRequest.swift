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
    
    func requestOpenDoor(door: String, requestDoorOpencompletitionHandler: @escaping (Int, Error?) -> ()) {
        let session = URLSession(configuration: .default)
        let url = URL(string: "\(baseUrl)/\(door)")!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                requestDoorOpencompletitionHandler(-1, error)
            }
            if let httpResponse = response as? HTTPURLResponse {
                requestDoorOpencompletitionHandler(httpResponse.statusCode, nil)
            }
        })
        
        task.resume()
    }
}
