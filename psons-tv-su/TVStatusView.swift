//
//  TVStatusView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/7/23.
//

import SwiftUI

struct TVStatusView: View {
    let statusPadInsets = EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10)
    let overallPadInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    let extraTopInsets = EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
    let extraBotomInsets = EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)

    var body: some View {
//        Text("TV Power")
        HStack {
            Text("My TV")
            VStack {
                HStack {
                    Text("TV Power:")
                    Spacer()
                    Text("On")
                }.padding(statusPadInsets).padding(extraTopInsets)
                HStack {
                    Text("Speaker Volume: ")
                    Spacer()
                    Text("50")
                }.padding(statusPadInsets)
                HStack {
                    Text("Current Channel")
                    Spacer()
                    Text("99")
                }.padding(statusPadInsets).padding(extraBotomInsets)
            }
            Spacer().frame(width: 40)
        }.padding(overallPadInsets)
            .background(Color.green)
            .foregroundColor(.white)
            .font(.headline)
    }
}

struct TVStatusView_Previews: PreviewProvider {
    static var previews: some View {
        TVStatusView()
    }
}
