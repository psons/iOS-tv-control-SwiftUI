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
}

