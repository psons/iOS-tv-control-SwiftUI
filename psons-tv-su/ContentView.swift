//
//  ContentView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    // print...
    //https://stackoverflow.com/questions/56517813/
      let _ =  print(shows)
        VStack {
            
//            Text("my data:\(flatEpisodes)")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
simle example
 struct ContentView: View {
     var body: some View {
         Text("Turtle Rock")
             .font(.title)
             .foregroundColor(.green)
     }
 */
