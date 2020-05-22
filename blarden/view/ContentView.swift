//
//  ContentView.swift
//  blarden
//
//  Created by Rafael Almeida on 13/10/2019.
//  Copyright © 2019 Rafael Almeida. All rights reserved.
//

import SwiftUI

struct BlardenActivityIndicator: UIViewRepresentable {
    @Binding var shouldAnimate: BlardenButtonStatus
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let uiActivityView = UIActivityIndicatorView()
        uiActivityView.color = UIColor.white
        return uiActivityView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView,
                      context: Context) {
        switch shouldAnimate {
        case .requestingState:
            uiView.startAnimating()
        default:
            uiView.stopAnimating()
        }
    }
}

struct ContentView: View {
    var openDoorRequest = OpenDoorRequest()
    @State var buttons = [BlardenButton(id: 0, name: "open-door", status: BlardenButtonStatus.defaultState), BlardenButton(id: 1, name: "outside-gate", status: BlardenButtonStatus.defaultState), BlardenButton(id: 2, name: "garage-gate", status: BlardenButtonStatus.defaultState)]
    
    var body: some View {
        ZStack {
            Color.init(red:0.92, green:0.97, blue:0.99)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 20) {
                    Spacer()
                    Button(action: {
                        authenticate { (status) in
                            if (status) {
                                self.buttons[0].status = BlardenButtonStatus.requestingState
                                self.openDoorRequest.requestOpenDoor(door: self.buttons[0].name, requestDoorOpencompletitionHandler: { statusCode, error in
                                    if statusCode == 200 {
                                        self.buttons[0].status = BlardenButtonStatus.okState
                                    } else {
                                        self.buttons[0].status = BlardenButtonStatus.errorState
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        self.buttons[0].status = BlardenButtonStatus.defaultState
                                    }
                                })
                            }
                        }
                    }) {
                        ZStack {
                            BlardenActivityIndicator(shouldAnimate: self.$buttons[0].status)
                            Group { () -> Text in
                                switch self.buttons[0].status {
                                case .okState:
                                    return Text(Translation.statusOk)
                                        .fontWeight(.black)
                                        .font(.title)
                                case .errorState:
                                    return Text(Translation.statusError)
                                        .fontWeight(.black)
                                        .font(.title)
                                case .defaultState:
                                    return Text(Translation.frontDoor)
                                        .font(.title)
                                case .requestingState:
                                    return Text("")
                                }
                            }
                        }
                    }
                    .buttonStyle(BlardenButtonStyle())
                    
                    Button(action: {
                        authenticate { (status) in
                            if (status) {
                                self.buttons[1].status = BlardenButtonStatus.requestingState
                                self.openDoorRequest.requestOpenDoor(door: self.buttons[1].name, requestDoorOpencompletitionHandler: { statusCode, error in
                                    if statusCode == 200 {
                                        self.buttons[1].status = BlardenButtonStatus.okState
                                    } else {
                                        self.buttons[1].status = BlardenButtonStatus.errorState
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        self.buttons[1].status = BlardenButtonStatus.defaultState
                                    }
                                })
                            }
                        }
                    }) {
                        ZStack {
                            BlardenActivityIndicator(shouldAnimate: self.$buttons[1].status)
                            Group { () -> Text in
                                switch self.buttons[1].status {
                                case .okState:
                                    return Text(Translation.statusOk)
                                        .fontWeight(.black)
                                        .font(.title)
                                case .errorState:
                                    return Text(Translation.statusError)
                                        .fontWeight(.black)
                                        .font(.title)
                                case .defaultState:
                                    return Text(Translation.outsideGate)
                                        .font(.title)
                                case .requestingState:
                                    return Text("")
                                }
                            }
                        }
                    }
                    .buttonStyle(BlardenButtonStyle())
                    
                    Button(action: {
                        authenticate { (status) in
                            if (status) {
                                self.buttons[2].status = BlardenButtonStatus.requestingState
                                self.openDoorRequest.requestOpenDoor(door: self.buttons[2].name, requestDoorOpencompletitionHandler: { statusCode, error in
                                    if statusCode == 200 {
                                        self.buttons[2].status = BlardenButtonStatus.okState
                                    } else {
                                        self.buttons[2].status = BlardenButtonStatus.errorState
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                        self.buttons[2].status = BlardenButtonStatus.defaultState
                                    }
                                })
                                
                            }
                        }
                    }) {
                        ZStack {
                            BlardenActivityIndicator(shouldAnimate: self.$buttons[2].status)
                            Group { () -> Text in
                                switch self.buttons[2].status {
                                case .okState:
                                    return Text(Translation.statusOk)
                                        .fontWeight(.black)
                                        .font(.title)
                                case .errorState:
                                    return Text(Translation.statusError)
                                        .fontWeight(.black)
                                        .font(.title)
                                case .defaultState:
                                    return Text(Translation.garageGate)
                                        .font(.title)
                                case .requestingState:
                                    return Text("")
                                }
                            }
                        }
                    }
                    .buttonStyle(BlardenButtonStyle())
                    Spacer()
                    Image("Black")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350.0, height: 200.0).offset(x: -50)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
    }
}
