// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let prayerAPIResponse = try? newJSONDecoder().decode(PrayerAPIResponse.self, from: jsonData)

import Foundation

// MARK: - PrayerAPIResponse
class PrayerAPIResponse: Codable {
    let code: Int
    let status: String
    let data: DataClass

    init(code: Int, status: String, data: DataClass) {
        self.code = code
        self.status = status
        self.data = data
    }
}

// MARK: - DataClass
class DataClass: Codable {
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
    let hijri: Hijri
    let gregorian: Gregorian

    init(readable: String, timestamp: String, hijri: Hijri, gregorian: Gregorian) {
        self.readable = readable
        self.timestamp = timestamp
        self.hijri = hijri
        self.gregorian = gregorian
    }
}

// MARK: - Gregorian
class Gregorian: Codable {
    let date, format, day: String
    let weekday: GregorianWeekday
    let month: GregorianMonth
    let year: String
    let designation: Designation

    init(date: String, format: String, day: String, weekday: GregorianWeekday, month: GregorianMonth, year: String, designation: Designation) {
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
    let abbreviated, expanded: String

    init(abbreviated: String, expanded: String) {
        self.abbreviated = abbreviated
        self.expanded = expanded
    }
}

// MARK: - GregorianMonth
class GregorianMonth: Codable {
    let number: Int
    let en: String

    init(number: Int, en: String) {
        self.number = number
        self.en = en
    }
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
    let date, format, day: String
    let weekday: HijriWeekday
    let month: HijriMonth
    let year: String
    let designation: Designation
    let holidays: [JSONAny]

    init(date: String, format: String, day: String, weekday: HijriWeekday, month: HijriMonth, year: String, designation: Designation, holidays: [JSONAny]) {
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
    let en, ar: String

    init(number: Int, en: String, ar: String) {
        self.number = number
        self.en = en
        self.ar = ar
    }
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
    let timezone: String
    let method: Method
    let latitudeAdjustmentMethod, midnightMode, school: String
    let offset: [String: Int]

    init(latitude: Double, longitude: Double, timezone: String, method: Method, latitudeAdjustmentMethod: String, midnightMode: String, school: String, offset: [String: Int]) {
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

// MARK: - Method
class Method: Codable {
    let id: Int
    let name: String
    let params: Params
    let location: Location

    init(id: Int, name: String, params: Params, location: Location) {
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

// MARK: - Params
class Params: Codable {
    let fajr: Double
    let isha: String

    enum CodingKeys: String, CodingKey {
        case fajr = "Fajr"
        case isha = "Isha"
    }

    init(fajr: Double, isha: String) {
        self.fajr = fajr
        self.isha = isha
    }
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
