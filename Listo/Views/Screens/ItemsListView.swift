//
//  ItemsListView.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import SwiftUI

struct ItemsListView: View {
    
    let theList: List
    
    @State private var searchText: String = ""
    
    /*var filteredItems: [Item] {
        if searchText.isEmpty {
            return theList.items
        } else {
            /*return theList.items.filter {
                //$0.localizedCase
            }*/
        }
    }*/ 
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .navigationTitle(theList.title)
            .searchable(text: $searchText, placement: .automatic, prompt: "Rechercher")
        }
    }
}

#Preview {
    ItemsListView(
        theList: List(
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
