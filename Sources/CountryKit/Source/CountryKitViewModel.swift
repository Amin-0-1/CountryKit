//
//  File.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation
import SwiftUI
import Combine

public final class CountryKitViewModel: ObservableObject {
    // MARK: - Properties
    private let countries: [Country] = Country.allCases
    private var cancellables: Set<AnyCancellable> = []
    private var preferred: [Country]
    private(set) var onCountrySelection: (Country) -> Void = { _ in }
    var groupedCountriesSortedKeys: [String] {
        let sortedKeys = groupedCountries.keys.sorted()
        return searchText.isEmpty ? [Constants.preferred.localized] + sortedKeys : sortedKeys
    }
    // MARK: - Publishers
    @Published var groupedCountries: [String: [Country]] = [:]
    @Published var searchText: String = ""

    // MARK: - Initializer
    public init(preferred: [Country] = [.EG, .SA], onSelect: @escaping (Country) -> Void = { _ in}) {
        self.preferred = preferred
        self.onCountrySelection = onSelect
        $searchText
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filterCountries(with: text)
            }.store(in: &cancellables)
    }

    // MARK: - Private funcs
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

        var groups = Dictionary(grouping: filtered) { $0.name.prefix(1).capitalized }

        if text.isEmpty {
            groups[Constants.preferred] = preferred
        }

        withAnimation {
            groupedCountries = groups
        }
    }
}

fileprivate extension CountryKitViewModel {
    enum Constants {
        static let preferred: String = "Preferred"
    }
}
