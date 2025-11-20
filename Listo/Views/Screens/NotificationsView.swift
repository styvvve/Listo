//
//  NotificationsView.swift
//  Listo
//
//  Created by NGUELE Steve  on 23/10/2025.
//

import SwiftUI

struct NotificationsView: View {
    
    @State private var notificationsActivees: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("Activer les notifications", isOn: $notificationsActivees)
                    .padding()
                    .bold()
            }
            .navigationTitle(Text("Notifications"))
        }
    }
}

#Preview {
    NotificationsView()
}
