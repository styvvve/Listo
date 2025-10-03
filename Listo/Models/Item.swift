//
//  Item.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var name: String
    var quantity: Int
    var isBought: Bool = false
}
