// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let prayerAPIResponse = try? newJSONDecoder().decode(PrayerAPIResponse.self, from: jsonData)

import Foundation

// MARK: - PrayerAPIResponse
class PrayerAPIResponse: Codable {
    let code: Int
    let status: String
    let data: [Datum]

    init(code: Int, status: String, data: [Datum]) {
        self.code = code
        self.status = status
        self.data = data
    }
}

// MARK: - Datum
class Datum: Codable {
    let timings: Timings
    let date: DateClass
    let meta: Meta

    init(timings: Timings, date: DateClass, meta: Meta) {
        self.timings = timings
        self.date = date
        self.meta = meta
    }
}

// MARK: - DateClass
class DateClass: Codable {
    let readable, timestamp: String
    let gregorian: Gregorian
    let hijri: Hijri

    init(readable: String, timestamp: String, gregorian: Gregorian, hijri: Hijri) {
        self.readable = readable
        self.timestamp = timestamp
        self.gregorian = gregorian
        self.hijri = hijri
    }
}

// MARK: - Gregorian
class Gregorian: Codable {
    let date: String
    let format: Format
    let day: String
    let weekday: GregorianWeekday
    let month: GregorianMonth
    let year: String
    let designation: Designation

    init(date: String, format: Format, day: String, weekday: GregorianWeekday, month: GregorianMonth, year: String, designation: Designation) {
        self.date = date
        self.format = format
        self.day = day
        self.weekday = weekday
        self.month = month
        self.year = year
        self.designation = designation
    }
}

// MARK: - Designation
class Designation: Codable {
    let abbreviated: Abbreviated
    let expanded: Expanded

    init(abbreviated: Abbreviated, expanded: Expanded) {
        self.abbreviated = abbreviated
        self.expanded = expanded
    }
}

enum Abbreviated: String, Codable {
    case ad = "AD"
    case ah = "AH"
}

enum Expanded: String, Codable {
    case annoDomini = "Anno Domini"
    case annoHegirae = "Anno Hegirae"
}

enum Format: String, Codable {
    case ddMmYyyy = "DD-MM-YYYY"
}

// MARK: - GregorianMonth
class GregorianMonth: Codable {
    let number: Int
    let en: PurpleEn

    init(number: Int, en: PurpleEn) {
        self.number = number
        self.en = en
    }
}

enum PurpleEn: String, Codable {
    case april = "April"
}

// MARK: - GregorianWeekday
class GregorianWeekday: Codable {
    let en: String

    init(en: String) {
        self.en = en
    }
}

// MARK: - Hijri
class Hijri: Codable {
    let date: String
    let format: Format
    let day: String
    let weekday: HijriWeekday
    let month: HijriMonth
    let year: String
    let designation: Designation
    let holidays: [String]

    init(date: String, format: Format, day: String, weekday: HijriWeekday, month: HijriMonth, year: String, designation: Designation, holidays: [String]) {
        self.date = date
        self.format = format
        self.day = day
        self.weekday = weekday
        self.month = month
        self.year = year
        self.designation = designation
        self.holidays = holidays
    }
}

// MARK: - HijriMonth
class HijriMonth: Codable {
    let number: Int
    let en: FluffyEn
    let ar: Ar

    init(number: Int, en: FluffyEn, ar: Ar) {
        self.number = number
        self.en = en
        self.ar = ar
    }
}

enum Ar: String, Codable {
    case رجب = "رَجَب"
    case شعبان = "شَعْبان"
}

enum FluffyEn: String, Codable {
    case rajab = "Rajab"
    case shaBān = "Shaʿbān"
}

// MARK: - HijriWeekday
class HijriWeekday: Codable {
    let en, ar: String

    init(en: String, ar: String) {
        self.en = en
        self.ar = ar
    }
}

// MARK: - Meta
class Meta: Codable {
    let latitude, longitude: Double
    let timezone: Timezone
    let method: Method
    let latitudeAdjustmentMethod: LatitudeAdjustmentMethod
    let midnightMode, school: MidnightMode
    let offset: [String: Int]

    init(latitude: Double, longitude: Double, timezone: Timezone, method: Method, latitudeAdjustmentMethod: LatitudeAdjustmentMethod, midnightMode: MidnightMode, school: MidnightMode, offset: [String: Int]) {
        self.latitude = latitude
        self.longitude = longitude
        self.timezone = timezone
        self.method = method
        self.latitudeAdjustmentMethod = latitudeAdjustmentMethod
        self.midnightMode = midnightMode
        self.school = school
        self.offset = offset
    }
}

enum LatitudeAdjustmentMethod: String, Codable {
    case angleBased = "ANGLE_BASED"
}

// MARK: - Method
class Method: Codable {
    let id: Int
    let name: Name
    let params: Params
    let location: Location

    init(id: Int, name: Name, params: Params, location: Location) {
        self.id = id
        self.name = name
        self.params = params
        self.location = location
    }
}

// MARK: - Location
class Location: Codable {
    let latitude, longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

enum Name: String, Codable {
    case islamicSocietyOfNorthAmericaISNA = "Islamic Society of North America (ISNA)"
}

// MARK: - Params
class Params: Codable {
    let fajr, isha: Int

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case isha = "Isha"
    }

    init(fajr: Int, isha: Int) {
        self.fajr = fajr
        self.isha = isha
    }
}

enum MidnightMode: String, Codable {
    case standard = "STANDARD"
}

enum Timezone: String, Codable {
    case europeLondon = "Europe/London"
}

// MARK: - Timings
class Timings: Codable {
    let fajr, sunrise, dhuhr, asr: String
    let sunset, maghrib, isha, imsak: String
    let midnight: String

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case sunrise = "Sunrise"
        case dhuhr = "Dhuhr"
        case asr = "Asr"
        case sunset = "Sunset"
        case maghrib = "Maghrib"
        case isha = "Isha"
        case imsak = "Imsak"
        case midnight = "Midnight"
    }

    init(fajr: String, sunrise: String, dhuhr: String, asr: String, sunset: String, maghrib: String, isha: String, imsak: String, midnight: String) {
        self.fajr = fajr
        self.sunrise = sunrise
        self.dhuhr = dhuhr
        self.asr = asr
        self.sunset = sunset
        self.maghrib = maghrib
        self.isha = isha
        self.imsak = imsak
        self.midnight = midnight
    }
}
