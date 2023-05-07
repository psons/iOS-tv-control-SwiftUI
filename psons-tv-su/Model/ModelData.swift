//
//  ModelData.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/6/23.
//

import Foundation

var flatEpisodes: [FlatEpisode] = load("streamdata.json")
let shows = getShows(flatEpisodes)

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

/**
 Builds list of Shows which contain Seasons, which contain Episodes.
 */
func getShows(_ flatEpisodes: [FlatEpisode]) -> [Show] {
    var showD: [String: Show] = [:]
    for fe in flatEpisodes {
        if  showD.keys.contains(fe.show) {
        } else {
            showD[fe.show] = Show(name: fe.show)
        }
        showD[fe.show]?.addFlatEpisode(flatEpisode: fe)
    }
    return showD.values.map({ (s: Show) -> Show in return s})
}
