//
//  ChannelPadView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/11/23.
//

import SwiftUI

struct ChannelPadView: View {
    @ObservedObject var tvState : TVState

    var body: some View {
        VStack {
            HStack {
                Button("0") {
                    tvState.addChannelDigit(digitString: "0")
                }
                Button("1") {
                    tvState.addChannelDigit(digitString: "1")
                }
                Button("2") {
                    tvState.addChannelDigit(digitString: "2")
                }
                Button("3") {
                    tvState.addChannelDigit(digitString: "3")
                }
            }
            HStack {
                Button("Ch+") {
                    debugPrint("Ch+")
                }
                Button("4") {
                    tvState.addChannelDigit(digitString: "4")
                }
                Button("5") {
                    tvState.addChannelDigit(digitString: "5")
                }
                Button("6") {
                    tvState.addChannelDigit(digitString: "6")
                }
            }
            HStack {
                Button("Ch-") {
                    debugPrint("Ch-")
                }
                Button("7") {
                    tvState.addChannelDigit(digitString: "7")
                }
                Button("8") {
                    tvState.addChannelDigit(digitString: "8")
                }
                Button("9") {
                    tvState.addChannelDigit(digitString: "9")
                }
            }

        }
    }
}

//struct ChannelPadView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChannelPadView(tvState: $tv)
//    }
//}
