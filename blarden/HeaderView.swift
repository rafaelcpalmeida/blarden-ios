//
//  Header.swift
//  blarden
//
//  Created by Rafael Almeida on 20/10/2019.
//  Copyright © 2019 Rafael Almeida. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Color.init(red: 0.63, green: 0.60, blue: 0.55)
                .edgesIgnoringSafeArea(.all)

            Image("Door").resizable()
                .frame(width: 214, height: 200)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
