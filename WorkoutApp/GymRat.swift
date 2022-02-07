//
//  GymRat.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import Foundation


class GymRat : ObservableObject {
    var firstName: String
    var lastName: String
    @Published var workouts: [Workout]
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.workouts = []
    }
    init() {
        firstName = ""
        lastName = ""
        workouts = []
    }
}
