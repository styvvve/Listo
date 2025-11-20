//
//  AuthRepository.swift
//  Listo
//
//  Created by NGUELE Steve  on 31/10/2025.
//

import Foundation
import FirebaseAuth

struct FirebaseDialog {
    var success: Bool = true
    var message: String = ""
}

class AuthRepository {
    func signUp(email: String, password: String) -> FirebaseDialog {
        var dialog = FirebaseDialog(success: true, message: "")
        Task {
            do {
                let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
                dialog.message = "L'utilisateur \(authResult.user.email ?? "") crée avec succès !"
            } catch {
                dialog.message = error.localizedDescription
                dialog.success = false
            }
        }
        return dialog
    }
}
