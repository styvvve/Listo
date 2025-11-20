//
//  EmailView.swift
//  Listo
//
//  Created by NGUELE Steve  on 23/10/2025.
//

import SwiftUI

struct EmailView: View {
    
    @State var user: User
    
    @State private var input: String = ""
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 0) {
                    Text("E-mail actuel : ")
                        .bold()
                    Text(user.email)
                        .bold()
                        .foregroundStyle(.red)
                    Spacer()
                }
                .padding()
                
                TextField(user.email, text: $input)
                    .padding(20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                            .padding(.horizontal, 10)
                    }
                
                Button {
                    showAlert.toggle()
                }label: {
                    Text("Valider")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding()
            }
            .navigationTitle(Text("E-mail"))
            .alert(
                "Changement d'e-mail", isPresented: $showAlert,
                actions: {
                    if #available(iOS 26.0, *) {
                        Button(role: .cancel) {
                            //nada mi amigo
                        }
                    } else {
                        Button("Annuler") {
                            
                        }
                    }
                    Button {
                        if !input.isEmpty {
                            user.email = input
                            
                            //nettoyage du field
                            input = ""
                        }
                    } label: {
                        Text("Confirmer")
                            
                    }
                }, message: {
                    Text("Êtes vous sûr de vouloir changer votre pseudo ? Il sera visibe par tous les utilisateurs qui vous suivent. C'est **irrévocable**.")
                })
        }
    }
}

#Preview {
    EmailView(user: User(name: "Steve", email: "styvvvenguele@icloud.com"))
}
