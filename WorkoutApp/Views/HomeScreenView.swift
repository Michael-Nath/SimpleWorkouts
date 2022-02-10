//
//  HomeScreenView.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var gymRat: GymRat
    @State var addingWorkout : Bool = false
    @State var workouts : [Workout] = []
    @ObservedObject var workoutViewModel = WorkoutViewModel()
    var body: some View {
        VStack {
            List(workouts, id: \.name) {
                workout in
                Text(workout.name)
            }
            Button("Add Workout") {
                self.addingWorkout.toggle()
            }.sheet(isPresented: $addingWorkout) {
                NewWorkoutView(addingWorkout: $addingWorkout)
            }
        }
        .navigationBarTitle("Welcome, \(gymRat.firstName)", displayMode: .large)
        .padding()
        .refreshable(action: {getWorkouts()})
    }
    private func getWorkouts(){
        workoutViewModel.getWorkouts(for: gymRat) {
            workouts in
            self.workouts = workouts
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
