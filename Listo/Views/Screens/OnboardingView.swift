//
//  OnboardingView.swift
//  Listo
//
//  Created by NGUELE Steve  on 30/10/2025.
//

import SwiftUI

enum OnBoardingPage: Int, CaseIterable {
    case liste
    case collaboration
    case pseudo
    case connect
    
    var title: String {
        switch self {
        case .liste:
            return "Élaborez vos listes"
        case .collaboration:
            return "À plusieurs c'est mieux !"
        case .pseudo:
            return "Choisissez un pseudo"
        case .connect:
            return "Prêt à vous lancer"
        }
    }
    
    var description: String {
        switch self {
        case .liste:
            return "Organisez vos courses ou vos tâches en un clin d'oeil."
        case .collaboration:
            return "Partagez vos listes et gérez les ensemble, en temps réel."
        case .pseudo:
            return "Personnalisez votre expérience avec un nom unique pour vos listes partagées."
        case .connect:
            return "Créez un compte ou connectez vous pour sauvegarder vos listes et collaborer partout."
        }
    }
}

struct OnboardingView: View {
    
    @State private var currentPage = 0
    @State private var isAnimating = false
    @State private var trackingProgress: CGFloat = 0.0
    
    //champs d'entrées
    @State private var pseudo = ""
    @State private var adresseMail = ""
    @State private var mdp = ""
    
    //instance de repos Auth de Firebase
    let authRepo = AuthRepository()
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(OnBoardingPage.allCases, id: \.rawValue) { page in
                    getPageView(for: page)
                        .tag(page.rawValue)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.spring(), value: currentPage)
            
            //indicateur de la page
            HStack(spacing: 12) {
                ForEach(0..<OnBoardingPage.allCases.count, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color.blue : Color.gray.opacity(0.5))
                        .frame(width: currentPage == index ? 12 : 8, height: currentPage == index ? 12 : 8)
                        .animation(.spring(), value: currentPage)
                }
            }
            .padding(.bottom, 20)
            
            //bouton
            Button {
                withAnimation(.spring()) {
                    if currentPage < OnBoardingPage.allCases.count - 1 {
                        currentPage += 1
                        
                        //restaurer l'animation
                        isAnimating = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                            isAnimating = true
                        })
                    } else {
                        //terminer 
                        //terminer de se connecter et on lance alors l'appli
                        if !adresseMail.isEmpty && !mdp.isEmpty {
                            Task {
                                authRepo.signUp(email: adresseMail, password: mdp)
                            }
                        }
                    }
                }
            } label: {
                Text(currentPage < OnBoardingPage.allCases.count - 1 ? "Suivant" : "Prêt")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [
                            Color.blue,
                            Color.blue.opacity(0.8)
                        ]), startPoint: .leading, endPoint: .trailing
                        )
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 30)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                withAnimation {
                    isAnimating = true
                }
            })
        }
    }
    
    @ViewBuilder
    private func getPageView(for page: OnBoardingPage) -> some View {
        //stack qui contient tout
        VStack(spacing: 20) {
            
            //images
            ZStack {
                switch page {
                case .liste:
                    Image("illustration1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                        .offset(y: isAnimating ? 0 : 20)
                        .animation(.spring(dampingFraction: 0.6).delay(0.2), value: isAnimating)
                    
                case .collaboration:
                    Image("illustration2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 240)
                        .offset(y: isAnimating ? 0 : 20)
                        .animation(.spring(dampingFraction: 0.6).delay(0.2), value: isAnimating)
                default:
                    EmptyView()
                }
            }
            
            
            //stack qui contient le texte
            VStack(spacing: 20) {
                Text(page.title)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 20)
                    .animation(.spring(dampingFraction: 0.8).delay(0.3), value: isAnimating)
                
                Text(page.description)
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 20)
                    .animation(.spring(dampingFraction: 0.8).delay(0.3), value: isAnimating)
                
                if page == .pseudo {
                    TextField("Ex: Quentin, Alain...", text: $pseudo)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding()
                        .animation(.spring(dampingFraction: 0.8).delay(0.3), value: isAnimating)
                } else if page == .connect {
                    VStack(spacing: 20) {
                        // Champ email
                        TextField("Adresse e-mail", text: $adresseMail)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .animation(.spring(dampingFraction: 0.8).delay(0.3), value: isAnimating)
                        
                        // Champ mot de passe
                        SecureField("Mot de passe", text: $mdp)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .animation(.spring(dampingFraction: 0.8).delay(0.3), value: isAnimating)
                        
                    }
                    .padding()
                }
            }
        }
        .padding(.top, 50)
    }
}

#Preview {
    OnboardingView()
}

