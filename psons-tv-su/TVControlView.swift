//
//  TVControlView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/11/23.
//

import SwiftUI


struct TVControlView: View {
    
//    @Binding var tvState : TVState
    @ObservedObject var tvState : TVState
//    var tvState : TVState
    
    var body: some View {
        HStack {
            Spacer().frame(width: 40)
            VStack {
                HStack {
                    Text("Power")
                    Spacer()
                    Toggle("Power", isOn: $tvState.powerIsOn).labelsHidden()
                }
                HStack {
                    Text("Volume")
                    Spacer()
                    Text("Put a slider here")
                }.padding(ControlRowInsets)
                HStack {
                    Text("Channel")
                    Spacer()
                    ChannelPadView(tvState: tvState)
                }.padding(ControlRowInsets)
            }
            Spacer().frame(width: 40)
        }    }
}

//struct TVControlView_Previews: PreviewProvider {
//    @State var previewTvState = TVState()
//    static var previews: some View {
//        TVControlView(tvState: $previewTvState)
//    }
//}
