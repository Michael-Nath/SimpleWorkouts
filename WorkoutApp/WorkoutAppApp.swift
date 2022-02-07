//
//  WorkoutAppApp.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/6/22.
//

import SwiftUI
import Firebase

@main
struct WorkoutAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
