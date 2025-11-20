//
//  List.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import Foundation
import SwiftUI

struct List: Identifiable, Codable {
    var id = UUID()
    var character: String
    var title: String
    var items: [Item]
    var color: String
    var isCompleted: Bool = false
    var creator: User
    var participants: [User]
}
