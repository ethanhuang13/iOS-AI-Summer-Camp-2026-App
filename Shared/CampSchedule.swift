import Foundation

enum CampSchedule {
  static let day1: [ScheduleItem] = [
    .init(day: .day1, hour: 9, minute: 15, durationMinutes: 30, title: "開場", speaker: "13"),
    .init(day: .day1, hour: 9, minute: 45, durationMinutes: 30, title: "開發環境設定", speaker: "Jane"),
    .init(day: .day1, hour: 10, minute: 15, durationMinutes: 105, title: "第一個 iOS 專案", speaker: "Jane"),
    .init(day: .day1, hour: 12, minute: 0, durationMinutes: 90, title: "午餐、自由交流", kind: .breakTime),
    .init(day: .day1, hour: 13, minute: 30, durationMinutes: 120, title: "AI 輔助開發實作", speaker: "Jane"),
    .init(day: .day1, hour: 15, minute: 30, durationMinutes: 75, title: "點心、組隊", speaker: "工作夥伴", kind: .milestone),
    .init(day: .day1, hour: 16, minute: 45, durationMinutes: 15, title: "今日課程結束", kind: .milestone),
  ]

  static let day2: [ScheduleItem] = [
    .init(day: .day2, hour: 8, minute: 40, durationMinutes: 20, title: "報到", kind: .milestone),
    .init(day: .day2, hour: 9, minute: 0, durationMinutes: 90, title: "Apple 原生框架＋Widget 實作", speaker: "13"),
    .init(day: .day2, hour: 10, minute: 30, durationMinutes: 15, title: "休息", kind: .breakTime),
    .init(day: .day2, hour: 10, minute: 45, durationMinutes: 75, title: "團隊分工與協作", speaker: "13"),
    .init(day: .day2, hour: 12, minute: 0, durationMinutes: 90, title: "午餐、自由交流", kind: .breakTime),
    .init(day: .day2, hour: 13, minute: 30, durationMinutes: 60, title: "上架前的準備", speaker: "13"),
    .init(day: .day2, hour: 14, minute: 30, durationMinutes: 60, title: "上架後的經營", speaker: "13"),
    .init(day: .day2, hour: 15, minute: 30, durationMinutes: 15, title: "休息", kind: .breakTime),
    .init(day: .day2, hour: 15, minute: 45, durationMinutes: 60, title: "點心、團隊時間", speaker: "13", kind: .milestone),
    .init(day: .day2, hour: 16, minute: 45, durationMinutes: 15, title: "課程結束", kind: .milestone),
  ]

  static let day3: [ScheduleItem] = [
    .init(day: .day3, hour: 8, minute: 40, durationMinutes: 20, title: "報到", kind: .milestone),
    .init(day: .day3, hour: 9, minute: 0, durationMinutes: 15, title: "SCC CLI、問答系統", speaker: "Vincent"),
    .init(day: .day3, hour: 9, minute: 15, durationMinutes: 165, title: "最終衝刺、報告準備", speaker: "講師群", kind: .milestone),
    .init(day: .day3, hour: 12, minute: 0, durationMinutes: 120, title: "午餐、學員互評、評審選十組", kind: .milestone),
    .init(day: .day3, hour: 14, minute: 0, durationMinutes: 120, title: "前十組發表", kind: .milestone),
    .init(day: .day3, hour: 16, minute: 0, durationMinutes: 25, title: "評審討論、同學休息", kind: .breakTime),
    .init(day: .day3, hour: 16, minute: 30, durationMinutes: 20, title: "頒獎", kind: .milestone),
    .init(day: .day3, hour: 16, minute: 50, durationMinutes: 15, title: "大合照、填寫問卷", kind: .milestone),
    .init(day: .day3, hour: 17, minute: 5, durationMinutes: 10, title: "課程結束", kind: .milestone),
  ]

  static var all: [ScheduleItem] {
    day1 + day2 + day3
  }

  static func items(for day: CampDay) -> [ScheduleItem] {
    switch day {
    case .day1: day1
    case .day2: day2
    case .day3: day3
    }
  }

  static func context(for day: CampDay, at date: Date) -> ScheduleContext {
    let items = items(for: day)
    guard let first = items.first, let last = items.last else {
      return ScheduleContext(phase: .afterEvent, current: nil, next: nil)
    }

    if date < first.startDate {
      return ScheduleContext(phase: .beforeEvent, current: nil, next: first)
    }

    if date >= last.endDate {
      return ScheduleContext(phase: .afterEvent, current: nil, next: nil)
    }

    if let current = items.first(where: { date >= $0.startDate && date < $0.endDate }) {
      let next = items.first(where: { $0.startDate >= current.endDate })
      return ScheduleContext(phase: .duringSession, current: current, next: next)
    }

    let next = items.first(where: { $0.startDate > date })
    return ScheduleContext(phase: .betweenSessions, current: nil, next: next)
  }
}

