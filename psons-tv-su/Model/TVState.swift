//
//  TVState.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/10/23.
//

import Foundation

class TVState: ObservableObject  {
    @Published var powerIsOn: Bool = false
    @Published var volume: Int  = 50
    var channel: Channel = Channel(99)
    @Published var channelDigits: String = ""
    
    func addChannelDigit(digitString: String) {
        channelDigits.append(digitString)
        print(channelDigits)
        if channelDigits.count > 1 {
            channelDigits =  channelDigits == "00" ? "01" : channelDigits
            print("Changing channel to \(channelDigits)")
            //todo verify that this magically updates the TVStatusView
            channel.numberString = channelDigits
            channelDigits = ""
        }

    }
    
}

class Channel: ObservableObject, CustomStringConvertible {
    var number: Int {
        get {return Channel.toChannelInt(fromString: numberString)}
        set { self.numberString = String(Channel.forceRange(newValue)) }
        }
    @Published var numberString: String = ""

    var description: String{
        return numberString
    }
    
    init(_ number: Int) {
        self.number = number
    }
    
    /**
     use conventional channel for invalid input
     */
    class func toChannelInt( fromString: String) -> Int {
        if let intFromString = Int(fromString) {
            return Channel.forceRange(intFromString)
        } else {
            return 1
        }
    }
    
    class func forceRange(_ n: Int) -> Int {
        let max = 99
        let min = 1
        if n > max {
            return max
        }
        if n < min {
            return min
        }
        return n
    }
    
    func increment() -> Channel {
        self.number = Channel.forceRange(self.number + 1)
        return self
    }
    func decrement() -> Channel {
        self.number = Channel.forceRange(self.number - 1)
        return self
    }
}

class FavoriteChannel: Channel {
    static let maxNameLen = 4
    static let minNameLen = 1
    var name: String
    init(name: String, _ number: Int) {
        self.name = name
        super.init(number)
    }
    
    class func isTooLongFor( name: String) -> Bool {
        return name.count > FavoriteChannel.maxNameLen
    }
    
    class func isTooShortFor(name: String) -> Bool {
        return name.count < FavoriteChannel.minNameLen
    }
    
    func asString() -> String {
        return "FavoriteChannel: name: \(self.name) number: \(self.number)"
    }

    func asBriefString() -> String {
        return "(\(self.name) \(self.number))"
    }
}

class FavoriteScreenState {
    //var favChannel = FavoriteChannel(name: "", -1)
    var index: Int
    let appFavArrayRef: [FavoriteChannel]
    
    /**
     Should deep copy the favChannel attributes into self.favChannel>
     appFavArrayRef is a reference to application state that will be updated.  It will alsobe used for rangfe checking index.
     favChannel is a storage object for the data a user is entering, but may not yet have saved to appFavArrayRef
     */
    init(appFavArrayRef: [FavoriteChannel], favChannel: FavoriteChannel, index: Int) {
        // todo - raise exception if index would be out of bounds for appFavArrayRef
        self.appFavArrayRef = appFavArrayRef
        //self.favChannel.name = favChannel.name
        //self.favChannel.number = favChannel.number
        self.index = index
    }
    
    /*
     commits values by copy from favChannel into appFavArrayRef at position index
     */
//    func commitToApp() {
//        self.appFavArrayRef[index].name = self.favChannel.name
//        self.appFavArrayRef[index].number = self.favChannel.number
//    }
    
    func asString() -> String {
        var singleString = "FavoriteScreenState\n"
        singleString += "\t appFavArrayRef is a Reference to an array of length: \(self.appFavArrayRef.count)\n"
        //singleString += "\t favChannel has values: " +  self.favChannel.asString() + "\n"
        singleString += "\t would commitToApp() at index: \(index)"
        return singleString
    }

    func asBriefString() -> String {
        var singleString = "FavoriteScreenState\n"
        let stringList = self.appFavArrayRef.map {( $0.asBriefString())}
        singleString += "\t appFavArrayRef: " + stringList.joined() + "length: \(self.appFavArrayRef.count)\n"
//        singleString += "\t favChannel: " +  self.favChannel.asBriefString() + "\n"
        singleString += "\t commit index: \(index)"
        return singleString
    }
}
