//
//  GymRatViewModel.swift
//  WorkoutApp
//
//  Created by Michael Nath on 2/7/22.
//

import Foundation
import FirebaseAuth

class GymRatViewModel : ObservableObject {
    @Published var db = GymRatRepository()
    var gymRat : GymRat = GymRat()
    func login(email: String, password: String) async throws -> GymRat {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            let result = await self.db.getUser(having: email)!
            if let firstName = result["firstName"] as? String {
                gymRat.firstName = firstName
            } else {
                print("Cannot find firstName property in the document")
            }
            if let lastName = result["lastName"] as? String {
                gymRat.lastName = lastName
            } else {
                print("Cannot find firstName property in the document")
            }
            if let email = result["email"] as? String {
                gymRat.email = email
            } else {
                print("Cannot find email property in the document")
            }
            return gymRat
        } catch {
            print("Error happened")
        }
        return gymRat
    }
}

