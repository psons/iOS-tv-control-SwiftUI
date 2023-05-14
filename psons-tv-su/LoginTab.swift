//
//  LoginTab.swift
//  psons-tv-su
//
//  Created by Paul Sons on 5/13/23.
//

import SwiftUI

struct LoginTab: View {
    @State var userName: String = "Name"
    @State var password: String = "...Secret..."
    @State var profileInfo: String = "Edit your User profile description here"
    @State var shouldShowProfileAlert: Bool = false
    @FocusState var profieInfoIsFocused: Bool

    let formRowInsets = EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0)
    let extraTopInsets = EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
    let overallPadInsets = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

    let screenSideMargin: CGFloat = 20

    var body: some View {
        ZStack {
//            Color("TVLoginTab")
//            Color.green
            HStack {
                Spacer().frame(width: screenSideMargin)
                VStack {
                    Grid {
                        GridRow {
                            Spacer().frame(height: 50)
                        }
                        GridRow {
                            Text("User Name: ").gridColumnAlignment(.leading).foregroundColor(.white)
                            TextField(
                                "u name:",
                                text: $userName)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .border(Color(UIColor.separator))
                                .background(Color.white)
                                .foregroundColor(.blue)
                                
                        }.padding(formRowInsets)
                        GridRow {
                            Text("Password: ").gridColumnAlignment(.trailing).foregroundColor(.white)
                            SecureField("Enter:", text: $password) {
                                doLogin(userName: userName, password: password)
                            }
                            .background(Color.white)
                            .foregroundColor(.blue)

                        }
                    }
                    HStack {
                        Text("User Profile :").foregroundColor(.white)
                        Spacer()
                    }.padding(extraTopInsets)
                    HStack {
                        TextEditor(text: $profileInfo //, {shouldShowProfileAlert = true}
                        )
                        .focused($profieInfoIsFocused)
                        .foregroundColor(.blue)
                    }
                    HStack {
                        Button {
                            profieInfoIsFocused = false
                            shouldShowProfileAlert = true
                            
                        } label: {
                            Text("Save Profile Info")
                                .frame(maxWidth: .infinity)
                        }.buttonStyle(.bordered)
                        .background(Color.white)
                    }
                    HStack {
                        Spacer().frame(height: 300)
                    }

                }
                Spacer().frame(width: screenSideMargin)
            }.padding(overallPadInsets)
                .background(Color.green)
                .font(.headline)
        }
    }
    
    func doLogin(userName: String, password: String) {
        debugPrint("userName: \(userName) password: \(password)")
    }
}

struct LoginTab_Previews: PreviewProvider {
    static var previews: some View {
        LoginTab()
    }
}
