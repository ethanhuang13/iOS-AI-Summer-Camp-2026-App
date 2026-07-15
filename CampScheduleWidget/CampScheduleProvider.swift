import WidgetKit

struct CampScheduleProvider: AppIntentTimelineProvider {
  func placeholder(in context: Context) -> CampScheduleEntry {
    .preview(day: .day2, hour: 9, minute: 15)
  }

  func snapshot(
    for configuration: CampScheduleConfigurationIntent,
    in context: Context
  ) async -> CampScheduleEntry {
    makeEntry(day: configuration.day.campDay, at: .now)
  }

  func timeline(
    for configuration: CampScheduleConfigurationIntent,
    in context: Context
  ) async -> Timeline<CampScheduleEntry> {
    let day = configuration.day.campDay
    let now = Date()
    let transitionDates = CampSchedule.items(for: day)
      .flatMap { [$0.startDate, $0.endDate] }
      .filter { $0 >= now }

    let dates = Array(Set([now] + transitionDates)).sorted()
    let entries = dates.map { makeEntry(day: day, at: $0) }

    return Timeline(entries: entries, policy: .atEnd)
  }

  private func makeEntry(day: CampDay, at date: Date) -> CampScheduleEntry {
    CampScheduleEntry(
      date: date,
      day: day,
      scheduleContext: CampSchedule.context(for: day, at: date),
      showsSpeakers: SchedulePreferences.showsSpeakers
    )
  }
}
