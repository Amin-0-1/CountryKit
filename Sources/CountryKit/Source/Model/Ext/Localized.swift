//
//  File.swift
//  CountryKit
//
//  Created by Amin on 24/07/2025.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, bundle: .module, comment: "")
    }
}
