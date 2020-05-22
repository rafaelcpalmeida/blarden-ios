//
//  DoorButton.swift
//  blarden
//
//  Created by Rafael Almeida on 15/05/2020.
//  Copyright © 2020 Rafael Almeida. All rights reserved.
//

import SwiftUI

struct BlardenButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 182, minHeight: 35.5)
            .padding()
            .foregroundColor(.white)
            .background(Color.init(red: 0.27, green: 0.68, blue: 0.99))
            .cornerRadius(40)
    }
}

struct BlardenButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        
        Button(action: {
        }) {
            HStack {
                Text("✓")
                    .fontWeight(.black)
                    .font(.title)
            }
        }
        .buttonStyle(BlardenButtonStyle())
    }
}
