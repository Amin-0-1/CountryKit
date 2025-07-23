//
//  File.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation
import CountryKit

struct CountryModel: Identifiable {
    let id = UUID()
    let country: Country

    static func map(countries: [Country]) -> [CountryModel] {
        countries.map(CountryModel.init)
    }
}
