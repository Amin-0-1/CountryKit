//
//  File.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation
import SwiftUI
import Combine

final class CountryKitViewModel: ObservableObject {
    private let countries: [Country] = Country.allCases
    private var cancellables: Set<AnyCancellable> = []
    var groupedCountriesSortedKeys: [String] {
        groupedCountries.keys.sorted()
    }
    @Published var groupedCountries: [String: [Country]] = [:]
    @Published var searchText: String = ""

    init() {

        $searchText
            .sink { [weak self] text in
                self?.filterCountries(with: text)
            }.store(in: &cancellables)
    }

    private func filterCountries(with text: String) {
        let filtered: [Country]

        if text.isEmpty {
            filtered = countries
        } else {
            filtered = countries.filter {
                $0.name.localizedCaseInsensitiveContains(text) ||
                $0.code.localizedCaseInsensitiveContains(text)
            }
        }

        withAnimation {
            groupedCountries = groupingCountries(filtered)
        }
    }

    private func groupingCountries(_ countries: [Country]) -> [String: [Country]] {
        Dictionary(grouping: countries) { $0.name.prefix(1).capitalized }
    }
}
