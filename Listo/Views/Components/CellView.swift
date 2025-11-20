//
//  CellView.swift
//  Listo
//
//  Created by NGUELE Steve  on 23/10/2025.
//

import SwiftUI

struct CellView: View {
    
    //texte qu'il y aura dans la cellule
    var texte: String
    var colorCell: Color
    
    var body: some View {
        HStack {
            Text(texte)
                .bold()
                .padding()
                .foregroundStyle(colorCell == .black ? .white : .black)
            Spacer()
            Image(systemName: "chevron.right.circle.fill")
                .padding()
                .font(.system(size: 25))
        }
        .background(colorCell.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal, 20)
    }
}

#Preview {
    CellView(texte: "test", colorCell: .blue)
}
