//
//  Color+.swift
//  Sopt38-SwiftUI
//
//  Created by 신서연 on 5/29/26.
//

import SwiftUI

extension Color {
    
    static let watchaGray100 = Color(hex: "#84868D")
    static let watchaGray200 = Color(hex: "#92959A")
    static let watchaGray300 = Color(hex: "#57585C")
    static let watchaGray400 = Color(hex: "#505155")
    static let watchaGray500 = Color(hex: "#505155")
    static let watchaGray600 = Color(hex: "#191A1C")
    static let watchaGrayCustom = Color(hex: "#BFBFBF")
    static let watchaGrayCustom2 = Color(hex: "#BABAC1")
    static let watchaGrayCustom3 = Color(hex: "#1B1C1D")
    
    static let watchaWhite = Color(hex: "#FFFFFF")
    static let watchaBlack = Color(hex: "#000000")
    
    static let watchaPink = Color(hex: "#DE2A60")
    static let watchaGreen = Color(hex: "#0ACA9E")
}

extension Color {
    init(hex: String) {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        self.init(
            red: Double((rgb >> 16) & 0xFF) / 255,
            green: Double((rgb >> 8) & 0xFF) / 255,
            blue: Double(rgb & 0xFF) / 255
        )
    }
}
