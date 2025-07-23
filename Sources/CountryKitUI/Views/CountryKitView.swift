//
//  SwiftUIView.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import SwiftUI

struct SwiftUIView: View {
    @StateObject private var viewModel = CountryKitViewModel()

    var body: some View {

        TextField("Searching".localized, text: $viewModel.searchText)
            .padding(10)
            .background(Color(.systemGray6))
            .roundedCorners()
            .padding()

        List(viewModel.filterredCountries) { country in
            CountryCell(country: country.country)
        }
    }
}

#Preview {
    SwiftUIView()
}
