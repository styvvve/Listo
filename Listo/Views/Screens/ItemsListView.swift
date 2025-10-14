//
//  ItemsListView.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import SwiftUI

struct ItemsListView: View {
    
    @State var theList: List
    @State var nouvelItem: String = ""
    
    //pour le clavier
    @FocusState private var isFocused: Bool
    
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    //demander la quantite de l'element apres l'entree
    @State private var quantite: String = ""
    @State private var isEditingQuantite: Bool = false //ca va etre sous la forme d'un sheet
    
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return theList.items
        } else {
            return theList.items.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ForEach($theList.items) { $item in
                    if searchText.isEmpty || item.name.localizedCaseInsensitiveContains(searchText) {
                        Toggle(isOn: $item.isBought) {
                            HStack {
                                Text("\(item.name) x \(item.quantity)")
                            }
                        }
                        .toggleStyle(checkboxToggleStyle())
                    }
                }
                TextField("Entrer un nouvel item", text: $nouvelItem)
                    .focused($isFocused)
                    .submitLabel(.done)
                    .onSubmit {
                        isFocused = false
                        
                        //genere un alert pour demander la quantite
                    }
                    .padding(.vertical)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .navigationTitle(theList.title)
            .searchable(text: $searchText, placement: .automatic, prompt: "Rechercher")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if isEditing {
                        Button {
                            isEditing.toggle()
                            print("Bouton done cliqué")
                        } label : {
                            if isEditing {
                                Text("Done")
                            }
                        }
                        .foregroundStyle(.blue)
                    } else {
                        Button {
                            isEditing.toggle()
                            print("Bouton edit cliqué")
                        }label: {
                            Image(systemName: "pencil")
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Bouton autres cliqué")
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
            }
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
