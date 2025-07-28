//
//  CountryCell.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import SwiftUI

struct CountryCell: View {
    let country: Country

    var body: some View {
        HStack {
            Text(country.flag)
                .font(.system(size: 40))
            Text(country.name)
                .font(.headline)
            Spacer()
            Text(country.dialCode)
                .font(.body)
                .layoutPriority(1)
        }
    }
}


@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout) {
    CountryCell(country: .EG)
}
