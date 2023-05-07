//
//  FlatEpisode.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/6/23.
//

import Foundation

import SwiftUI
import CoreLocation

/*
 The Flat Episode json with a show and season atribute on every object.
 From Rust:
 struct FlatEpisode {
     show: String,
     season: String,
     episode_n: String,
     season_n: String,
     title: String,
     director: String,
     writer: String,
     air_date: String,  // leaving this as string.  I'll deal with it in Swift if I need to.
 }

 */
struct FlatEpisode: Hashable, Codable /*, Identifiable*/ {
    var show: String
    var season: String
    var episode_n: String
    var season_n: String
    var title: String
    var director: String
    var writer: String
    var air_date: String  // convert to date in translation.
    
    init(show: String, season: String, episode_n: String, season_n: String, title: String, director: String, writer: String, air_date: String) {
        self.show = show
        self.season = season
        self.episode_n = episode_n
        self.season_n = season_n
        self.title = title
        self.director = director
        self.writer = writer
        self.air_date = air_date
    }
}

/*
 Todo - make Episode
    - Identifiable protocol with a id attribute.
    - convert data string to some ISO happy date
 Todo - make Season identifiable with id, name, and list of Episodes.
 Todo - make Show identifiable with id, name, and list of Seasons.
 */


struct Episode {
    var episode_n: String
    var season_n: String
    var title: String
    var director: String
    var writer: String
    var air_date: String  // convert to date in translation.
    
    init(episode_n: String, season_n: String, title: String, director: String, writer: String, air_date: String) {
        self.episode_n = episode_n
        self.season_n = season_n
        self.title = title
        self.director = director
        self.writer = writer
        self.air_date = air_date
    }
    
    func fromFlat() {
        
    }
}

struct Season {
    var name: String // is FlatEpisode.season
    var episodes: [Episode]
    
    init(name: String, episodes: [Episode]) {
        self.name = name
        self.episodes = []
    }
    
}

struct Show {
    var name: String // is FlatEpisode.show
    var seasons: [Season]

//    init(flatEpisode: FlatEpisose) {
//        self.name = name
//        self.seasons = seasons
//    }
    
    init(name: String) {
        self.name = name
        self.seasons = []
    }
    
    // makr sure the season ad episode in flatEpisode exist.
    func addFlatEpisode(flatEpisode: FlatEpisode) {
        // https://cocoacasts.com/swift-fundamentals-how-to-check-if-dictionary-contains-given-key
        // birthdays.index(forKey: "Emma") != nil
        if self.seasons.contains(where: <#T##(Season) throws -> Bool#>{ (s: Season) -> Bool in return s.name == flatEpisode.season}) {
            print("todo Show already has this season.  need to add episode ")
        } else {
            print("todo need to add a season and an episode")
        }
    }
    
}
