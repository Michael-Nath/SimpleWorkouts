//
//  Workout.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import Foundation

struct Set {
    var name : String
    var muscleGroup: MuscleGroups
    var reps: Int
    var weight: Double
    var time: Date
}

enum MuscleGroups {
    // Follows Push Pull Legs (PPL)
    case triceps
    case shoulders
    case chest
    case biceps
    case back
    case legs
}
