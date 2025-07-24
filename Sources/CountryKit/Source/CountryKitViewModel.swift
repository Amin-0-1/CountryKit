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
    private let countries: [CountryModel] = CountryKit.allCountries.map{ CountryModel(country: $0) }
    private var cancellables: Set<AnyCancellable> = []
    var groupedCountriesSortedKeys: [String] {
        groupedCountries.keys.sorted()
    }
    @Published var groupedCountries: [String: [CountryModel]] = [:]
    @Published var searchText: String = ""

    init() {

        $searchText
            .sink { [weak self] text in
                self?.filterCountries(with: text)
            }.store(in: &cancellables)
    }

    private func filterCountries(with text: String) {
        let filtered: [CountryModel]

        if text.isEmpty {
            filtered = countries
        } else {
            filtered = countries.filter {
                $0.country.name.localizedCaseInsensitiveContains(text) ||
                $0.country.code.localizedCaseInsensitiveContains(text)
            }
        }

        withAnimation {
            groupedCountries = groupingCountries(filtered)
        }
    }

    private func groupingCountries(_ countries: [CountryModel]) -> [String: [CountryModel]] {
        Dictionary(grouping: countries) { $0.country.name.prefix(1).capitalized }
    }
}
