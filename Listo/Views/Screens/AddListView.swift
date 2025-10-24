//
//  AddListView.swift
//  Listo
//
//  Created by NGUELE Steve  on 24/10/2025.
//

/*
 var id = UUID()
 var character: String
 var title: String
 var items: [Item]
 var color: String
 var isCompleted: Bool = false
 var creator: User
 var participants: [User]
 
 */

import SwiftUI


struct AddListView: View {
    
    let user: User
    
    //pour le picker
    @State var whoIsTheCreator: [String] = [
        "Vous",
        "Autre"
    ]
    
    @State var unItem: Item = Item(name: "", quantity: 0)
    
    @State var character: String = ""
    @State var title: String = ""
    @State var items: [Item] = []
    
    //une couleur de type couleur pour le picker
    @State var colorForPicker: Color = .red
    @State var color: String = ""
    
    @State var isCompleted: Bool = false
    @State var creator: User = User(name: "", email: "")
    @State var participants: [User] = []
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Nom de la liste")
                    .font(.headline)
                TextField("Nom de la liste", text: $title)
                    .padding(20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    }
                
                
                    ColorPicker("Choisissez une couleur", selection: $colorForPicker)
                    .font(.headline)
                
                //choisir un emoji
                Text("Choisissez une icône")
                .font(.headline)
                
                EmojisPicker(selectedEmoji: $character)
                HStack {
                    Text("Créateur/créatrice")
                        .font(.headline)
                    Spacer()
                    
                    Picker("", selection: $creator) {
                        ForEach(whoIsTheCreator, id: \.self) { creat in
                            Text(creat)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        //valider tout ca
                    } label: {
                        Text("Valider")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .navigationTitle(Text("Créer une liste"))
        }
    }
}

#Preview {
    AddListView(user: User(name: "Test", email: "test@gmail.com"))
}
