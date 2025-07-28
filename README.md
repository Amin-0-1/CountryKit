# 🌍 CountryKit

A lightweight Swift Package for managing country metadata including names, ISO codes, flags 🇵🇸, and international dial codes 📞.  
Designed to be simple, localizable, and easily embeddable into any iOS or macOS project.

---

## 🚀 Features

- ✅ Country name localized to the user's current locale
- ✅ Emoji flag from ISO country code
- ✅ Dial code (e.g. `+1`, `+44`, etc.)
- ✅ Plug-and-play with `CountryKit.allCountries`
- ✅ SwiftUI support via `CountryKitView` with optional preferred countries

---

## 📦 Installation

### Swift Package Manager

#### Option 1: Using `Package.swift`

Add the dependency to your `Package.swift` file:
```swift
.package(url: "https://github.com/Amin-0-1/CountryKit.git", from: "1.0.0")
```

#### Option 2: Using Xcode
Open your project in Xcode.
Go to File > Add Packages...
Enter the URL:
```swift
"https://github.com/Amin-0-1/CountryKit.git"
```
Choose the package and add it to your desired target.

## 🛠 Usage

1. Manual
Import and use the package manually:

```
import CountryKit

let countries = CountryKit.allCountries

for country in countries {
    print(country.flag, country.name, country.dialCode)
}
```

2. SwiftUI with CountryKitView
Use the provided SwiftUI view and optionally pass preferred countries:

```
import CountryKit

CountryKitView(preferred: [.EG, .SA]) { selectedCountry in
    print(selectedCountry.flag, selectedCountry.name, selectedCountry.dialCode)
}
```

✅ Requirements
- ```iOS 14.0+```
- ```macOS 10.15+```
- ```Swift 5.3+```


| Preview 1 | Preview 2 |
|-----------|-----------|
| <img src="https://github.com/user-attachments/assets/ba80392c-61fe-46b5-9000-c6d7e996e8e5" alt="image" width="500" /> | <img src="https://github.com/user-attachments/assets/3d34402e-b65d-4ae8-9e17-c4d2cdd3de8e" alt="image" width="500" /> |




