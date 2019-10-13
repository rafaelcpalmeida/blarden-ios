//
//  ContentView.swift
//  blarden
//
//  Created by Rafael Almeida on 13/10/2019.
//  Copyright © 2019 Rafael Almeida. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var openDoorRequest = OpenDoorRequest()
    @State var showingAlert: Bool = false
    @State var tittle: String = ""
    @State var message: String = ""
    
    var body: some View {
        VStack{
            Button(action: {
                let doorOpened = self.openDoorRequest.requestDoorOpen()
                if doorOpened == true {
                    self.showingAlert = true
                    self.tittle = "Success"
                    self.message = "Door is opened"
                } else {
                    self.showingAlert = true
                    self.tittle = "Error"
                    self.message = "An error has occurred. Please, try again later."
                }
            }) {
                HStack {
                    Text("Open door")
                        .fontWeight(.light)
                        .font(.title)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(40)
            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text(tittle), message: Text(message))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
