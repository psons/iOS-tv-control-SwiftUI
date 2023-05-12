//
//  ChannelPadView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/11/23.
//

import SwiftUI

struct ChannelPadView: View {
    @ObservedObject var tvState : TVState
    
    // leading and trailing are 0 because VStack centering is used.
    let buttonPadInsets = EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
    
    var body: some View {
        HStack {
            VStack {
                Button("0") {
                    tvState.addChannelDigit(digitString: "0")
                }.padding(buttonPadInsets)
                Button("Ch+") {
                    debugPrint("Ch+")
                    tvState.doIncrement()
                }.padding(buttonPadInsets)
                Button("Ch-") {
                    debugPrint("Ch-")
                    tvState.doDecrement()
                }.padding(buttonPadInsets)
            }
            Spacer()
            VStack {
                Button("1") {
                    tvState.addChannelDigit(digitString: "1")
                }.padding(buttonPadInsets)
                Button("4") {
                    tvState.addChannelDigit(digitString: "4")
                }.padding(buttonPadInsets)
                Button("7") {
                    tvState.addChannelDigit(digitString: "7")
                }.padding(buttonPadInsets)
            }
            Spacer()
            VStack {
                Button("2") {
                    tvState.addChannelDigit(digitString: "2")
                }.padding(buttonPadInsets)
                Button("5") {
                    tvState.addChannelDigit(digitString: "5")
                }.padding(buttonPadInsets)
                Button("8") {
                    tvState.addChannelDigit(digitString: "8")
                }.padding(buttonPadInsets)
            }
            Spacer()
            VStack {
                Button("3") {
                    tvState.addChannelDigit(digitString: "3")
                }.padding(buttonPadInsets)
                Button("6") {
                    tvState.addChannelDigit(digitString: "6")
                }.padding(buttonPadInsets)
                Button("9") {
                    tvState.addChannelDigit(digitString: "9")
                }.padding(buttonPadInsets)
            }
        }
    }
}

//struct ChannelPadView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelPadView(tvState: $tv)
//    }
//}
