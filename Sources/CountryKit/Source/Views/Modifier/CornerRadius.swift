//
//  SwiftUIView.swift
//  CountryKit
//
//  Created by Amin on 24/07/2025.
//

import SwiftUI

struct CornerRadius: ViewModifier {
    var radius: CGFloat

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content
                .clipShape(RoundedRectangle(cornerRadius: radius))
        } else {
            content.cornerRadius(radius)
        }
    }
}

extension View {
    func roundedCorners(_ radius: CGFloat = 8) -> some View {
        modifier(CornerRadius(radius: radius))
    }
}
