//
//  Country.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation

public struct Country: Codable {
    public let code: String
    public var name: String {
        Locale
            .current
            .localizedString(
                forRegionCode: code
            ) ?? code
    }
    public var flag: String {
        code.toFlag()
    }
    public let dialCode: String
}

fileprivate extension String {
    func toFlag() -> String {
        self.uppercased()
            .unicodeScalars
            .compactMap { UnicodeScalar(127397 + $0.value) }
            .map { String($0) }
            .joined()
    }
}

