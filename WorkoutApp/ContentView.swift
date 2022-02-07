//
//  ContentView.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/6/22.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loggedIn: Bool = false
    @StateObject var user : GymRat = GymRat()
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            NavigationLink(destination: HomeScreenView().environmentObject(user), isActive: $loggedIn) {
                Button(action: {login()}) {
                    Text("Log in")
                }
            }
        }
        .padding()
        .navigationBarTitle("Michael's Workout Tracker", displayMode: .inline)
    
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if (error != nil) {
                print(error?.localizedDescription ?? "")
            } else {
                // TODO: replace hard-coded values with values returned from auth
                self.user.firstName = "Michael"
                self.user.lastName = "Nath"
                self.loggedIn = true
                print("Success")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
