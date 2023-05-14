//
//  StreamTab.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/12/23.
//

import SwiftUI


let mediaTitleColor: Color = /*@START_MENU_TOKEN@*/Color(hue: 0.697, saturation: 0.97, brightness: 0.987)/*@END_MENU_TOKEN@*/
let loginTab: Color = Color(red: 20, green: 171, blue: 32)



struct StreamTab: View {
    var body: some View {
        NavigationView { // Show nav
            List(shows) { show in
                NavigationLink(destination: ShowDetail(show: show)) {
                    ShowRow(show: show)
                }.padding(controlRowInsets).background()
            }.navigationTitle("Stream Shows")
        }
        
    }
}

struct ShowRow: View {
    var show: Show
    var body: some View {
        HStack {Image(systemName: "tv.and.mediabox")
            Text(show.name).font(.headline).foregroundColor(mediaTitleColor)
            Spacer()
            VStack {
                Text("\(show.seasons.count) seasons,").font(.subheadline)
                Text("\(show.getEpisodeCount()) episodes,").font(.subheadline)

            }

        }
    }
}


struct StreamTab_Previews: PreviewProvider {
    static var previews: some View {
        StreamTab()
    }
}
