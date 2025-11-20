//
//  ListCell.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import SwiftUI

struct ListCell: View {
    
    let listCell: List
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(listCell.character)
                    .font(.title)
                    .bold()
                    .padding(40)
            }
            .padding()
            .background(Color(hex: listCell.color))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(listCell.title)
                .font(.title2)
                .bold()
            Text("\(listCell.participants.count) participant\(listCell.participants.count > 1 ? "s" : "" )")
            
        }
    }
}

#Preview {
    ListCell(
        listCell: List(
            character: "🛒",
            title: "Groceries",
            items: [
                Item(name: "Apples", quantity: 4),
                Item(name: "Bread", quantity: 1)
            ],
            color: "F23D1F",
            creator: User(name: "Alice", email: "alice@example.com"),
            participants: [
                User(name: "Bob", email: "bob@example.com")
            ]
        )
    )
}
