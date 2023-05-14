//
//  EpisodeDetail.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/12/23.
//

import SwiftUI

struct EpisodeRow: View {
    var season: Season
    var episode: Episode

    var body: some View {
        HStack {Image(systemName: "film")
            Text(episode.title).font(.headline).foregroundColor(mediaTitleColor)
            Spacer()
        }
    }
}

//struct EpisodeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeRow(season: shows[0].seasons[1], episode: shows[0].seasons[1].episodes[0])
//    }
//}

struct EpisodeDetail: View {
    var season: Season
    var episode: Episode
    var body: some View {
        Grid(alignment: .leading) {
            GridRow() {
                Text("\(episode.title)")
                    .foregroundColor(mediaTitleColor)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }.gridCellColumns(2)
            GridRow() {
                Text("no:")
                Text("\(episode.season_n) of \(episode.episode_n)")
            }
            GridRow {
                Text("Aired:")
                Text("\(episode.air_date)")
            }
            GridRow {
                Text("Writer:")
                Text("\(episode.writer)")
            }
            GridRow {
                Text("Director:")
                Text("\(episode.director)")
            }
        }
        Spacer()
        
    }
}

struct HLabelValue: View {
    var label: String
    var value: String
    init(_ label: String, _ value: String) {
        self.label = label
        self.value = value
    }
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
            Spacer()
        }
    }
}

//struct EpisodeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        EpisodeRow(season: shows[0].seasons[1], episode: shows[0].seasons[1].episodes[0])
//    }
//}

struct EpisodeDetail_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetail(season: shows[0].seasons[1], episode: shows[0].seasons[1].episodes[0])
    }
}
