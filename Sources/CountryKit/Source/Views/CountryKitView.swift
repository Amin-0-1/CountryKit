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
            .background(Color(.secondarySystemBackground))
            .roundedCorners()
            .padding()

        List {
            ForEach(viewModel.groupedCountriesSortedKeys, id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(viewModel.groupedCountries[key] ?? []) { countryModel in
                        Button {
                            onSelect(countryModel.country)
                        } label: {
                            CountryCell(country: countryModel.country)
                        }
                        .foreground(color: Color(.label))
                    }
                }
            }
        }
    }
}

#Preview {
    CountryKitView(onSelect: { _ in print("pressed")})
}
