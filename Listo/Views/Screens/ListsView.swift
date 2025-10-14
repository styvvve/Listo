//
//  ListsView.swift
//  Listo
//
//  Created by NGUELE Steve  on 09/10/2025.
//

import SwiftUI

struct ListsView: View {
    
    @State var listes: [List]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(listes, id: \.id) { liste in
                        NavigationLink(destination: ItemsListView(theList: liste)) {
                            ListCell(listCell: liste)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationTitle("Listes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Bouton perso appuyé")
                    } label: {
                        Image(systemName: "person.crop.circle")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Bouton plus appuyé")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    let user1 = User(name: "Steve", email: "steve@mail.com")
    let user2 = User(name: "Lina", email: "lina@mail.com")
    let user3 = User(name: "Tom", email: "tom@mail.com")
    
    let sampleLists: [List] = [
        List(
            character: "🍎",
            title: "Courses de la semaine",
            items: [
                Item(name: "Pommes", quantity: 2),
                Item(name: "Pâtes", quantity: 7),
                Item(name: "Lait", quantity: 10)
            ],
            color: "FF6B6B",
            creator: user1,
            participants: [user1, user2, user3]
        ),
        List(
            character: "🎉",
            title: "Anniversaire de Lina",
            items: [
                Item(name: "Gâteau", quantity: 1),
                Item(name: "Bonbon", quantity: 20),
                Item(name: "Jus de fruits", quantity: 10)
            ],
            color: "FFD93D",
            creator: user2,
            participants: [user1, user2, user3]
        ),
        List(
            character: "💻",
            title: "Projets SwiftUI",
            items: [
                Item(name: "Design UI", quantity: 1),
                Item(name: "Fonctionnalités", quantity: 2),
                Item(name: "Tests", quantity: 1)
            ],
            color: "4ECDC4",
            creator: user3,
            participants: [user1, user3]
        )
    ]
    
    ListsView(listes: sampleLists)
}
