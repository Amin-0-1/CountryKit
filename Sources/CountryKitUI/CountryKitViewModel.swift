//
//  File.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation
import CountryKit
import SwiftUI
import Combine

final class CountryKitViewModel: ObservableObject {
    private let countries: [CountryModel] = CountryKit.all.map{ CountryModel(country: $0) }
    private var cancellables: Set<AnyCancellable> = []
    @Published var filterredCountries: [CountryModel] = []
    @Published var searchText: String = ""

    init() {

        $searchText
            .sink { [weak self] text in
                guard let self = self else { return }

                withAnimation {
                    guard !searchText.isEmpty else { self.filterredCountries = self.countries ; return }

                    self.filterredCountries = self.countries.filter {
                        $0.country.name.localizedCaseInsensitiveContains(text) ||
                        $0.country.code.localizedCaseInsensitiveContains(text)
                    }
                }
            }.store(in: &cancellables)
    }
}
