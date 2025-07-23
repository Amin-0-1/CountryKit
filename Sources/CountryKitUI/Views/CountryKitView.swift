//
//  SwiftUIView.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import SwiftUI

struct SwiftUIView: View {
    @StateObject var viewModel = CountryKitViewModel()

    var body: some View {
        List(viewModel.countries) { country in
            CountryCell(country: country.country)
        }
    }
}

#Preview {
    SwiftUIView()
}
