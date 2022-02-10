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
    @State var gymRatViewModel: GymRatViewModel = GymRatViewModel()
    @StateObject var gymRat : GymRat = GymRat()
    var body: some View {
        VStack {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            NavigationLink(destination: HomeScreenView().environmentObject(gymRat), isActive: $loggedIn) {
                Button(action: {login()}) {
                    Text("Log in")
                }
            }
        }
        .padding()
        .navigationBarTitle("Michael's Workout Tracker", displayMode: .inline)
    }
    func login() {
        Task {
            do {
                let newGymRat =  try await gymRatViewModel.login(email: email.lowercased(), password: password)
                gymRat.firstName = newGymRat.firstName
                gymRat.lastName = newGymRat.lastName
                gymRat.email = newGymRat.email
                loggedIn = true
            } catch {
                print("Oh shit")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
