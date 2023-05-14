//
//  ContentView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/6/23.
//

import SwiftUI

// Global style
let controlRowInsets = EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)

struct ContentView: View {
    var body: some View {
        //https://stackoverflow.com/questions/56517813/
        let _ =  print(shows)
        TabView {
            TVTab().tabItem {
                Label("Tune", systemImage: "antenna.radiowaves.left.and.right")
            }
            LoginTab().tabItem {
                Label("Login", systemImage: "person.badge.key")
            }
            StreamTab()
                .tabItem {
                    Label("Stream", systemImage: "externaldrive")
                }
        }
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
