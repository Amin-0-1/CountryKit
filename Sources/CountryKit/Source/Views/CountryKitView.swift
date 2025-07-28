//
//  SwiftUIView.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import SwiftUI

public struct CountryKitView: View {
    @StateObject private var viewModel: CountryKitViewModel

    public init(preferred: [Country] = [], onSelect: @escaping (Country) -> Void = { _ in}) {
        _viewModel = StateObject(wrappedValue: .init(preferred: preferred, onSelect: onSelect))
    }
    
    public var body: some View {

        TextField(Constants.searching, text: $viewModel.searchText)
            .padding(Constants.textFieldPadding)
            .background(Color(.secondarySystemBackground))
            .roundedCorners()
            .padding()

        List {
            ForEach(viewModel.groupedCountriesSortedKeys, id: \.self) { key in
                Section(header: Text(key)) {
                    ForEach(viewModel.groupedCountries[key] ?? []) { countryModel in
                        Button {
                            viewModel.onCountrySelection(countryModel)
                        } label: {
                            CountryCell(country: countryModel)
                        }
                        .foreground(color: Color(.label))
                    }
                }
            }
        }
    }
}

fileprivate extension CountryKitView {
    enum Constants {
        static let textFieldPadding: CGFloat = 10
        static let searching = "Searching".localized
    }
}

#Preview {
    CountryKitView()
}
