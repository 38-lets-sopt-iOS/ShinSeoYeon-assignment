//
//  Color+.swift
//  Sopt38-assignment
//
//  Created by 신서연 on 4/24/26.
//

import UIKit

extension UIColor {
    
    // 왓챠 컬러 시스템
    
    static let watchaGray100 = UIColor(hex: "#84868D")
    static let watchaGray200 = UIColor(hex: "#92959A")
    static let watchaGray300 = UIColor(hex: "#57585C")
    static let watchaGray400 = UIColor(hex: "#505155")
    static let watchaGray500 = UIColor(hex: "#505155")
    static let watchaGray600 = UIColor(hex: "#191A1C")
    static let watchaGrayCustom = UIColor(hex: "#BFBFBF")
    static let watchaGrayCustom2 = UIColor(hex: "#BABAC1")
    static let watchaGrayCustom3 = UIColor(hex: "#1B1C1D")
    
    static let watchaWhite = UIColor(hex: "#FFFFFF")
    static let watchaBlack = UIColor(hex: "#000000")
    
    static let watchaPink = UIColor(hex: "#DE2A60")
    static let watchaGreen = UIColor(hex: "#0ACA9E")
}

// 헥스 변환

extension UIColor {
    convenience init(hex: String) {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255,
            green: CGFloat((rgb >> 8) & 0xFF) / 255,
            blue: CGFloat(rgb & 0xFF) / 255,
            alpha: 1
        )
    }
}

