//
//  File.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation
import CountryKit

final class CountryKitViewModel: ObservableObject {
    @Published var countries: [CountryModel] = CountryKit.all.map{CountryModel(country: $0)}
}
