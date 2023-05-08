//
//  ContentView.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/6/23.
//

import SwiftUI

struct ContentView: View {
    let ControlRowInsets = EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10)

    var body: some View {
        //https://stackoverflow.com/questions/56517813/
        let _ =  print(shows)
        TabView {
            VStack {
                TVStatusView()
                Text("My Remote Control").font(.title).padding()
                HStack {
                    Spacer().frame(width: 40)
                    VStack {
                        HStack {
                            Text("Power")
                            Spacer()
                            Text("Put a Toggle here")
                        }
                        HStack {
                            Text("Volue")
                            Spacer()
                            Text("Put a slider here")
                        }.padding(ControlRowInsets)
                    }
                    Spacer().frame(width: 40)
                }

            }.tabItem {
                Label("Select Type", systemImage: "list.dash")
            }
                
            Text("Stream Show Screen").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding()
                .tabItem {
                    Label("Stream", systemImage: "list.dash")
                }
        }
    }
//        TabView {
//            VStack {
//
//            }
//        }.tabItem
//        Label("Select Type", systemImage: "list.dash")
//    }
//    // print...
//
//      let _ =  print(shows)
//        VStack {
//
//
//        }
//        .padding()
    
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
