//
//  User.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var email: String
}
