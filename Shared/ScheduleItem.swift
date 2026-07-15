import Foundation

struct ScheduleItem: Codable, Hashable, Identifiable, Sendable {
  let id: String
  let day: CampDay
  let startDate: Date
  let durationMinutes: Int
  let title: String
  let speaker: String?
  let kind: Kind

  enum Kind: String, Codable, Sendable {
    case session
    case breakTime
    case milestone
  }

  var endDate: Date {
    startDate.addingTimeInterval(TimeInterval(durationMinutes * 60))
  }

  var timeLabel: String {
    startDate.formatted(
      Date.FormatStyle()
        .hour(.twoDigits(amPM: .omitted))
        .minute(.twoDigits)
        .locale(Locale(identifier: "en-GB"))
    )
  }

  var durationLabel: String {
    "\(durationMinutes) 分鐘"
  }

  init(
    day: CampDay,
    hour: Int,
    minute: Int,
    durationMinutes: Int,
    title: String,
    speaker: String? = nil,
    kind: Kind = .session
  ) {
    self.id = "day\(day.rawValue)-\(String(format: "%02d%02d", hour, minute))-\(title)"
    self.day = day
    self.startDate = CampCalendar.calendar.date(
      bySettingHour: hour,
      minute: minute,
      second: 0,
      of: day.date
    )!
    self.durationMinutes = durationMinutes
    self.title = title
    self.speaker = speaker
    self.kind = kind
  }
}
