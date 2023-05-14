//
//  ShowDetail.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/13/23.
//

import SwiftUI

struct ShowDetail: View {
    var show: Show
    
    var body: some View {
        VStack(alignment: .center) {
            Text(show.name).foregroundColor(mediaTitleColor).font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            //Spacer().frame(height: 30)
            Text("Enhance the data model with showDescription to display here.")
            NavigationView {
                List(show.seasons) { season in
                    NavigationLink(destination: SeasonDetail(show: show, season: season)) {
                        SeasonRow(show: show, season: season)
                    }
                    .padding(ControlRowInsets)
//                    .background()
                }.navigationTitle("Seasons")
            }
            Spacer()
        }.padding()
           // .navigationBarTitle("\(show.name)") //.foregroundColor(mediaTitleColor)
    }
}

struct SeasonRow: View {
    var show: Show
    var season: Season
    var body: some View {
        HStack {Image(systemName: "calendar")
            Text(season.name)
                .foregroundColor(mediaTitleColor)
                .font(.headline)
            Spacer()
            VStack {
                Text("\(season.episodes.count) episodes,").font(.subheadline)
            }

        }
    }
}

struct ShowDetail_Previews: PreviewProvider {
    static var previews: some View {
        ShowDetail(show: shows[0])
    }
}
