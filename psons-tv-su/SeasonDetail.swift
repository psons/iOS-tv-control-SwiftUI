//
//  SeasonDetail.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/12/23.
//

import SwiftUI

struct SeasonDetail: View {
    let show: Show
    let season: Season
    
    var body: some View {
        VStack {
            Text("\(season.name)")
                .foregroundColor(mediaTitleColor)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

            NavigationView {
                List(season.episodes) { episode in
                    NavigationLink(destination: EpisodeDetail(season: season, episode: episode)) {
                        EpisodeRow(season: season, episode: episode)
                    }.padding(controlRowInsets).background()
                }.navigationTitle("Episodes")
            }

        }
    }
}

struct SeasonDetail_Previews: PreviewProvider {
    static var previews: some View {
        SeasonDetail(show: shows[0], season: shows[0].seasons[1])
    }
}
