//
//  Color.swift
//  Listo
//
//  Created by NGUELE Steve  on 03/10/2025.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
           let scanner = Scanner(string: hex)
           var rgb: UInt64 = 0
           scanner.scanHexInt64(&rgb)
           let r = Double((rgb >> 16) & 0xFF) / 255
           let g = Double((rgb >> 8) & 0xFF) / 255
           let b = Double(rgb & 0xFF) / 255
           self.init(red: r, green: g, blue: b)
       }
       
       func toHex() -> String {
           let uiColor = UIColor(self)
           var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
           uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
           let rgb = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
           return String(format:"#%06X", rgb)
       }
}
