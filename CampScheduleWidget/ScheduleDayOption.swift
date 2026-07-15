import AppIntents

enum ScheduleDayOption: String, AppEnum {
  case day1
  case day2
  case day3

  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "活動日")

  static var caseDisplayRepresentations: [ScheduleDayOption: DisplayRepresentation] = [
    .day1: "Day 1",
    .day2: "Day 2",
    .day3: "Day 3",
  ]

  var campDay: CampDay {
    switch self {
    case .day1: .day1
    case .day2: .day2
    case .day3: .day3
    }
  }
}

