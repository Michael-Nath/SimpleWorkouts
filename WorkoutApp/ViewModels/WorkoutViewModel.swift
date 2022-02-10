//
//  WorkoutViewModel.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/8/22.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    @Published var db = WorkoutRepository()
    func addWorkout(name: String, gymRat: GymRat)  {
        let error = db.addWorkout(name: name, email: gymRat.email.lowercased())
        guard error == nil else {
            fatalError("Error adding workout")
        }
    }
    
    func getWorkouts(for gymRat: GymRat, completion: @escaping ([Workout]) -> Void) {
        DispatchQueue.main.async {
            Task {
                let workouts = await self.db.getWorkouts(forUser: gymRat.email.lowercased())
                gymRat.setWorkouts(workouts)
                completion(gymRat.getWorkouts())
            }
        }
    }
}
