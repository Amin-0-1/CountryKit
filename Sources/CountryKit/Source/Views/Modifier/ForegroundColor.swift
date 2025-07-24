//
//  SwiftUIView.swift
//  CountryKit
//
//  Created by Amin on 24/07/2025.
//

import SwiftUI

struct ForegroundColor: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content.foregroundStyle(color)
        } else {
            content.foregroundColor(color)
        }
    }
}

extension View {
    func foreground(color: Color) -> some View {
        modifier(ForegroundColor(color: color))
    }
}
