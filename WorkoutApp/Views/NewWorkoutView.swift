//
//  NewWorkoutView.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import SwiftUI

struct NewWorkoutView: View {
    @State var name : String = ""
    @Binding var addingWorkout: Bool
    @ObservedObject var workoutViewModel = WorkoutViewModel()
    @EnvironmentObject var user: GymRat
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            Button("Add") {
                workoutViewModel.addWorkout(name: name, gymRat: user)
                addingWorkout.toggle()
            }
        }
        .font(.title2)
    }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView(addingWorkout: Binding.constant(false))
    }
}
