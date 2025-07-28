//
//  Country.swift
//  CountryKit
//
//  Created by Amin on 23/07/2025.
//

import Foundation

public enum Country: String, CaseIterable, Identifiable {

    case AF, AX, AL, DZ, AS, AD, AO, AI, AQ, AG, AR, AM, AW, AU, AT, AZ
    case BS, BH, BD, BB, BY, BE, BZ, BJ, BM, BT, BO, BQ, BA, BW, BV, BR
    case IO, BN, BG, BF, BI, KH, CM, CA, CV, KY, CF, TD, CL, CN, CX, CC
    case CO, KM, CG, CD, CK, CR, CI, HR, CU, CW, CY, CZ, DK, DJ, DM, DO
    case EC, EG, SV, GQ, ER, EE, SZ, ET, FK, FO, FJ, FI, FR, GF, PF, TF
    case GA, GM, GE, DE, GH, GI, GR, GL, GD, GP, GU, GT, GG, GN, GW, GY
    case HT, HN, HK, HU, IS, IN, ID, IR, IQ, IE, IM, IT, JM, JP, JE, JO
    case KZ, KE, KI, KP, KR, KW, KG, LA, LV, LB, LS, LR, LY, LI, LT, LU
    case MO, MG, MW, MY, MV, ML, MT, MH, MQ, MR, MU, YT, MX, FM, MD, MC
    case MN, ME, MS, MA, MZ, MM, NA, NR, NP, NL, NC, NZ, NI, NE, NG, NU
    case NF, MK, MP, NO, OM, PK, PW, PS, PA, PG, PY, PE, PH, PN, PL, PT
    case PR, QA, RE, RO, RU, RW, BL, SH, KN, LC, MF, PM, VC, WS, SM, ST
    case SA, SN, RS, SC, SL, SG, SX, SK, SI, SB, SO, ZA, GS, SS, ES, LK
    case SD, SR, SJ, SE, CH, SY, TW, TJ, TZ, TH, TL, TG, TK, TO, TT, TN
    case TR, TM, TC, TV, UG, UA, AE, GB, US, UM, UY, UZ, VU, VE, VN, VG
    case VI, WF, EH, YE, ZM, ZW

    public var dialCode: String {
        countryCode[self] ?? id
    }

    public var id: String { code }

    public var code: String { rawValue }

    public var flag: String { code.toFlag() }

    public var name: String {
        Locale.current.localizedString(forRegionCode: code) ?? code
    }
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

