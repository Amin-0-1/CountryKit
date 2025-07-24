//
//  SwiftUIView.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import SwiftUI

public struct CountryKitView: View {
    @StateObject private var viewModel = CountryKitViewModel()
    var onSelect: (Country) -> Void

    public init(onSelect: @escaping (Country) -> Void = { _ in}) {
        self.onSelect = onSelect
    }
    public var body: some View {

        TextField("Searching".localized, text: $viewModel.searchText)
            .padding(10)
            .background(Color(.systemGray6))
            .roundedCorners()
            .padding()

        List(viewModel.filterredCountries) { countryModel in
            CountryCell(country: countryModel.country)
                .onTapGesture {
                    onSelect(countryModel.country)
                }
        }
    }
}

#Preview {
    CountryKitView(onSelect: { _ in print("pressed")})
}
