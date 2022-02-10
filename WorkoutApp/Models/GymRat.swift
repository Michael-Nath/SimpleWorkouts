//
//  GymRat.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import Foundation
import Firebase

class GymRat : ObservableObject {
    var firstName: String
    var lastName: String
    var email: String
    @Published private var workouts: [Workout]
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.workouts = []
    }
    init() {
        firstName = ""
        lastName = ""
        email = ""
        workouts = []
    }
    
    func setWorkouts(_ workouts: [Workout]) {
        self.workouts = workouts
    }
    
    func getWorkouts() -> [Workout] {
        return self.workouts
    }
    
}

func retreiveGymRat() {
    
}
