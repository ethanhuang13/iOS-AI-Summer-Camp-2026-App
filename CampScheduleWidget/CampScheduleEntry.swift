import WidgetKit

struct CampScheduleEntry: TimelineEntry {
  let date: Date
  let day: CampDay
  let scheduleContext: ScheduleContext
  let showsSpeakers: Bool

  static func preview(day: CampDay, hour: Int, minute: Int) -> CampScheduleEntry {
    let date = CampCalendar.calendar.date(
      bySettingHour: hour,
      minute: minute,
      second: 0,
      of: day.date
    )!

    return CampScheduleEntry(
      date: date,
      day: day,
      scheduleContext: CampSchedule.context(for: day, at: date),
      showsSpeakers: true
    )
  }
}

