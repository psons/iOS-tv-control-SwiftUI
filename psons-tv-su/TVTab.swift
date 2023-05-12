//
//  TVTab.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/10/23.
//

import SwiftUI


struct TVTab: View {
    @StateObject var tvState = TVState()
//    @State var tvState = TVState()

    var body: some View {
        VStack {
            TVStatusView(tvState: tvState)
            Text("TV Remote Control").font(.title).padding()
            TVControlView(tvState: tvState)
        }
    }
}

struct TVTab_Previews: PreviewProvider {
    static var previews: some View {
        TVTab()
    }
}



