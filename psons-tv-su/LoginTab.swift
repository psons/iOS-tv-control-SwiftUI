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
    @State var profileInfo: String = "Edit your User profile descripotion here"
    var body: some View {
        ZStack {
            Color("TVLoginTab")
            HStack {
                Spacer().frame(width: 40)
                VStack {
                    Grid {
                        GridRow {
                            Spacer().frame(height: 50)
                        }
                        GridRow {
                            Text("User Name: ").gridColumnAlignment(.trailing)
                            TextField(
                                "User Name:",
                                text: $userName)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .border(Color(UIColor.separator))
                                .background(Color.white)
                        }
                        GridRow {
                            Text("Password: ").gridColumnAlignment(.trailing)
                            SecureField("Enter:", text: $password) {
                                doLogin(userName: userName, password: password)
                            }                                .background(Color.white)

                        }
                        GridRow{
                            Text("User Profile :")
                        }
                        GridRow {
                            TextEditor(text: $profileInfo).gridCellColumns(2)
                        }
                        GridRow {
                            Spacer().frame(height: 300)
                        }
                    }
                }
                Spacer().frame(width: 40)
            }
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
