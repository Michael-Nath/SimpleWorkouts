//
//  HomeScreenView.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var user: GymRat
    @State var addingWorkout : Bool = false
    var body: some View {
        VStack {
            Button("Add Workout") {
                self.addingWorkout.toggle()
            }.sheet(isPresented: $addingWorkout) {
                NewWorkoutView()
            }
        }
        .navigationBarTitle("Welcome, \(user.firstName)", displayMode: .large)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
