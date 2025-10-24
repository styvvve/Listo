//
//  EmojisPicker.swift
//  Listo
//
//  Created by NGUELE Steve  on 24/10/2025.
//

import SwiftUI

struct EmojisPicker: View {
    
    let listEmojis: [String] = [
        "🗒️", "✅", "📦", "🧠", "💼", // Organisation & travail
        "🍎", "🥦", "🍞", "☕", "🍕", // Courses & nourriture
        "✈️", "🏖️", "🎒", "🎮", "📸", // Voyages & loisirs
        "🏠", "🛒", "🧹", "🛏️", "💡"  // Vie quotidienne & maison
    ]
    
    @Binding var selectedEmoji: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(listEmojis, id: \.self) { emoji in
                    Text(emoji)
                        .font(.largeTitle)
                        .padding(20)
                        .background(emoji == selectedEmoji ? Color.blue.opacity(0.4) : Color.orange.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            selectedEmoji = emoji
                        }
                }
            }
            .padding()
        }
    }
}

#Preview {
    EmojisPicker(selectedEmoji: .constant("🛒"))
}
