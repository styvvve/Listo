//
//  ToggleStyle.swift
//  Listo
//
//  Created by NGUELE Steve  on 08/10/2025.
//

import Foundation
import SwiftUI

struct checkboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 2)
                .frame(width: 25, height: 25)
                //.clipShape(RoundedRectangle(cornerRadius: 5.0))
                .overlay {
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                }
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
            
            configuration.label
        }
    }
}
