//
//  TVControlView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/11/23.
//

import SwiftUI

struct TVControlView: View {
    
    @ObservedObject var tvState : TVState
    @State private var favoriteColor = 0
    let favArray: [(String, Int)] = [("CBS",2), ("NBC", 5), ("ABC", 7), ("FOX", 32)]

    var labelMarginWidth: CGFloat = 180
    @State private var favChannelIdx = 0

    var body: some View {
        HStack {
//            Spacer().frame(width: labelMarginWidth)
            VStack {
                HStack {
                    Text("Power").frame(width: labelMarginWidth)
                    Spacer()
                    Toggle("Power", isOn: $tvState.powerIsOn).labelsHidden()
                }// .padding(ControlRowInsets)
                HStack {
                    Text("Volume").frame(width: labelMarginWidth)
                    Spacer()
                    Slider(value: $tvState.volume, in: 01...100).padding(.leading)
                }.padding(controlRowInsets).disabled(!tvState.powerIsOn)
                HStack {
                    Text("Channel").frame(width: labelMarginWidth)
                    Spacer()
                    ChannelPadView(tvState: tvState)
                }.padding(controlRowInsets).disabled(!tvState.powerIsOn)
                HStack {
                    Text("Favorite Channel").frame(width: labelMarginWidth)
                    Spacer()
                    Picker("Favorite channel?", selection: $favChannelIdx) {
                        Text(favArray[0].0).tag(0)
                        Text(favArray[1].0).tag(1)
                        Text(favArray[2].0).tag(2)
                        Text(favArray[3].0).tag(3)
                    }.onChange(of: favChannelIdx) {
                        tag in
                        debugPrint("FavChannel tag: \(tag)")
                        tvState.channel.number = favArray[tag].1
                        tvState.channelDigits = ""
                    }
                    .pickerStyle(.segmented)
                }.padding(controlRowInsets).disabled(!tvState.powerIsOn)
//                Text("favChannelIdx: \(favChannelIdx)")
            }
            Spacer().frame(width: 40)
        }
        
    }
}

//struct TVControlView_Previews: PreviewProvider {
//    @State var previewTvState = TVState()
//    static var previews: some View {
//        TVControlView(tvState: previewTvState)
//    }
//}

/*
picker to replace Segmented control
 - https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-segmented-control-and-read-values-from-it
onchange action from picker:
 - https://stackoverflow.com/questions/57518852/swiftui-picker-onchange-or-equivalent
*/
