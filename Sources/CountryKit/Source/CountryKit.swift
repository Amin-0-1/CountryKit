//
//  CountryKit.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation

public struct CountryKit {
    public static var all: [Country] {
        guard let url = Bundle.module.url(forResource: "Countries", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let list = try? JSONDecoder().decode([Country].self, from: data) else { return [] }

        return list
    }
}
