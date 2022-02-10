//
//  WorkoutRepository.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import Foundation
import FirebaseFirestore
import Firebase
class WorkoutRepository : ObservableObject {
    let store = Firestore.firestore()
    func addWorkout(name: String, email: String) -> Error? {
        var error : Error? = nil
        let newWorkout : [String: Any] = [
            "name" : name,
            "sets": []
        ]
        store.collection("/users/\(email)/workouts").addDocument(data: newWorkout) {
            err in
            if (err != nil) {
                error = err
            }
        }
        return error
    }
    
    func getWorkouts(forUser email: String) async -> [Workout] {
        var workouts : [Workout] = []
        do {
            let query = try await store.collection("/users/\(email)/workouts").getDocuments()
            query.documents.forEach {
                document in
                let workoutInfo = document.data()
                let workout = Workout(name: workoutInfo["name"] as! String, sets: workoutInfo["sets"] as! [Set])
                workouts.append(workout)
            }
        } catch {
            fatalError("Failed to get workouts")
        }
        return workouts
    }
}
