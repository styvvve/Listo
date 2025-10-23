//
//  SettingsView.swift
//  Listo
//
//  Created by NGUELE Steve  on 23/10/2025.
//

import SwiftUI

struct SettingsView: View {
    
    let user: User
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: 100))
                    
                    Text(user.name)
                        .bold()
                        .font(.largeTitle)
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        
                    } label : {
                        CellView(texte: "Nom d'utilisateur/pseudo", colorCell: colorScheme == .dark ? Color.white : Color.black)
                    }
                    .buttonStyle(.plain)
                    
                    NavigationLink {
                        
                    } label : {
                        CellView(texte: "Email", colorCell: colorScheme == .dark ? Color.white : Color.black)
                    }
                    .buttonStyle(.plain)
                    NavigationLink {
                        
                    } label : {
                        CellView(texte: "Notifications", colorCell: colorScheme == .dark ? Color.white : Color.black)
                    }
                    .buttonStyle(.plain)
                }
                
                Spacer()
            }
            .navigationTitle(Text("Paramètres"))
        }
    }
}

#Preview {
    SettingsView(user: User(name: "Steve", email: "styvvvenguele@icloud.com"))
}
