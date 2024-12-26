//
//  CustomButton.swift
//  BUCanteen
//
//  Created by Prince on 25/09/24.
//

import Foundation
import SwiftUI

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.size.width
        let h = rect.size.height
// Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        path.closeSubpath()
        return path
    }
}

extension Color {
    
    static var custorange: Color {
        return Color(hex: "F3775A")
    }
    
    static var custyellow: Color {
        return Color(hex: "D3B744")
    }
    
    static var orangetopview: Color {
        return Color(hex: "EF7F1A")
    }
    
    static var priceText: Color {
        return Color(hex: "E36447")
    }
    
    static var colorBoarde: Color {
        return Color(hex: "A9A9A9")
    }
    
    static var custblack: Color {
        return Color(hex: "1C1C1C")
    }
    
    static var custFontGray: Color {
        return Color(hex: "535353")
    }
    
    
    static var custBlack1: Color {
        return Color(hex: "2E2E2E")
    }
    
    static var custGray2: Color {
        return Color(hex: "696969")
    }
    
    static var custFontLightGray: Color {
        return Color(hex: "525252")
    }
    static var custWhite: Color {
        return Color(hex: "FFFFFF")
    }
    static var custBgColor: Color {
        return Color(hex: "ECEFED")
    }
//    static var custLightPink: Color {
//        return Color(hex: "FFE3CF")
//    }
//    static var custFilterGray: Color {
//        return Color(hex: "F6F6F6")
//    }
//    static var custgray2: Color {
//             return Color(hex: "686868")
//      }
//      static var custgreen: Color {
//             return Color(hex: "7BAB41")
//      }
//    static var custFontDarkGray: Color {
//            return Color(hex: "515151")
//          }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB(12 -bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
//extension UIScreen{
//   static let screenWidth = UIScreen.main.bounds.size.width
//   static let screenHeight = UIScreen.main.bounds.size.height
//   static let screenSize = UIScreen.main.bounds.size
//}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
