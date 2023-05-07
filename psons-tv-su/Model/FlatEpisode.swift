//
//  FlatEpisode.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/6/23.
//

import Foundation

import SwiftUI
import CoreLocation

struct FlatEpisode: Hashable, Codable {
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


struct Episode: CustomStringConvertible {
    var id: Int  // Identifiable protocol.
    var episode_n: String
    var season_n: String
    var title: String
    var director: String
    var writer: String
    var air_date: String  // convert to date in translation.
    var description: String {
        let heading = "{Episode}|id:\(self.id)|title: \(title)|."
        return heading
    }

    
    init(episode_n: String, season_n: String, title: String, director: String, writer: String, air_date: String) {
        self.id = Int(episode_n)!  // willing to blow up here for project if don't get an Int.
        self.episode_n = episode_n
        self.season_n = season_n
        self.title = title
        self.director = director
        self.writer = writer
        self.air_date = air_date
    }
    
    init(_ fe: FlatEpisode) {
        self.id = Int(fe.episode_n)!  // willing to blow up here for project if don't get an Int.
        self.episode_n = fe.episode_n
        self.season_n = fe.season_n
        self.title = fe.title
        self.director = fe.director
        self.writer = fe.writer
        self.air_date = fe.air_date
    }
}

struct Season: CustomStringConvertible {
    var id: Int  // Identifiable protocol.
    var name: String // is FlatEpisode.season
    var episodes: [Episode]
    var description: String {
        let heading = "{Season}|id:\(self.id)|name: \(name):\n"
        var episodesAsStr = ""
        for episode in self.episodes {
            episodesAsStr += "\t\t\(episode)\n"
        }
        return heading + episodesAsStr
    }

    init(name: String, id: Int) {
        self.id = id
        self.name = name
        self.episodes = []
    }
    
    // make sure the episode in flatEpisode exists.
    mutating func addFlatEpisode(flatEpisode: FlatEpisode) {
        if self.episodes.contains(where: { (e: Episode) -> Bool in return e.title == flatEpisode.title}) {
            //print("Season::addFlatEpisode - Season already has \(flatEpisode.title)")
        } else {
            self.episodes.append(Episode(flatEpisode))
            //print("Season::addFlatEpisode - Added episode to Season: \(self) ")
        }
    }
    
    
}


var showID: Int  = 1

struct Show: CustomStringConvertible, Identifiable {
    var id = showID
    var name: String // is FlatEpisode.show
    var seasons: [Season]
    var description: String {
        let heading = "{Show}|id:\(self.id)|name:\(self.name):\n"
        var seasonsAsStr = ""
        for season in self.seasons {
            seasonsAsStr += "\t\(season)\n"
        }
        return heading + seasonsAsStr

    }
       
    init(name: String) {
        self.name = name
        self.seasons = []
        showID += 1
    }
    
    // make sure the season and episode in flatEpisode exist.
    mutating func addFlatEpisode(flatEpisode: FlatEpisode) {
        //https://cocoacasts.com/swift-fundamentals-how-to-check-if-dictionary-contains-given-key
        if self.name != flatEpisode.show {
            assertionFailure("FlatEpisode not part of this {Show}|\(self.name)| should not have \(flatEpisode)")
        }
        var feAdded = false
        for (idx, _) in self.seasons.enumerated() {
            if seasons[idx].name == flatEpisode.season {
                //print("Found season in Show. added episode.")
                seasons[idx].addFlatEpisode(flatEpisode: flatEpisode)
                feAdded = true
            }
        }
        if !feAdded {
            var newSeason = Season(name: flatEpisode.season, id: self.seasons.count + 1)
            newSeason.addFlatEpisode(flatEpisode: flatEpisode)
            self.seasons.append(newSeason)
            //print("added a season and episode: \(self)")
        }
    }
}
