import Foundation

enum CampDay: Int, CaseIterable, Codable, Identifiable, Sendable {
  case day1 = 1
  case day2 = 2
  case day3 = 3

  var id: Int { rawValue }

  var title: String {
    "Day \(rawValue)"
  }

  var date: Date {
    switch self {
    case .day1:
      return CampCalendar.date(year: 2026, month: 7, day: 15)
    case .day2:
      return CampCalendar.date(year: 2026, month: 7, day: 16)
    case .day3:
      return CampCalendar.date(year: 2026, month: 7, day: 17)
    }
  }

  var dateLabel: String {
    date.formatted(
      Date.FormatStyle()
        .month(.abbreviated)
        .day()
        .locale(Locale(identifier: "zh-Hant-TW"))
    )
  }

  static func closest(to date: Date) -> CampDay {
    if let matchingDay = allCases.first(where: {
      CampCalendar.calendar.isDate($0.date, inSameDayAs: date)
    }) {
      return matchingDay
    }

    return .day2
  }
}

enum CampCalendar {
  static var calendar: Calendar {
    var calendar = Calendar(identifier: .gregorian)
    calendar.locale = Locale(identifier: "zh-Hant-TW")
    calendar.timeZone = TimeZone(identifier: "Asia/Taipei")!
    return calendar
  }

  static func date(
    year: Int = 2026,
    month: Int = 7,
    day: Int,
    hour: Int = 0,
    minute: Int = 0
  ) -> Date {
    calendar.date(
      from: DateComponents(
        timeZone: calendar.timeZone,
        year: year,
        month: month,
        day: day,
        hour: hour,
        minute: minute
      )
    )!
  }
}

