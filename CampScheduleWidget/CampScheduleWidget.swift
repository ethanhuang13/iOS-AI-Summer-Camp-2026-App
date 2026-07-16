import SwiftUI
import WidgetKit

struct CampScheduleWidget: Widget {
  let kind = "CampScheduleWidget"

  var body: some WidgetConfiguration {
    AppIntentConfiguration(
      kind: kind,
      intent: CampScheduleConfigurationIntent.self,
      provider: CampScheduleProvider()
    ) { entry in
      CampScheduleWidgetView(entry: entry)
    }
    .configurationDisplayName("Summer Camp 日程")
    .description("不用打開 App，也能看到現在與接下來的活動。")
    .supportedFamilies(
      [.systemSmall, .systemMedium, .systemLarge]
    )
  }
}

#Preview("Day 1 Timeline", as: .systemMedium) {
  CampScheduleWidget()
} timeline: {
  CampScheduleEntry.preview(day: .day1, hour: 9, minute: 0)
  CampScheduleEntry.preview(day: .day1, hour: 9, minute: 20)
  CampScheduleEntry.preview(day: .day1, hour: 9, minute: 50)
  CampScheduleEntry.preview(day: .day1, hour: 10, minute: 30)
  CampScheduleEntry.preview(day: .day1, hour: 12, minute: 15)
  CampScheduleEntry.preview(day: .day1, hour: 13, minute: 45)
  CampScheduleEntry.preview(day: .day1, hour: 15, minute: 45)
  CampScheduleEntry.preview(day: .day1, hour: 16, minute: 50)
  CampScheduleEntry.preview(day: .day1, hour: 17, minute: 5)
}

#Preview("Day 2 Timeline", as: .systemMedium) {
  CampScheduleWidget()
} timeline: {
  CampScheduleEntry.preview(day: .day2, hour: 8, minute: 30)
  CampScheduleEntry.preview(day: .day2, hour: 8, minute: 45)
  CampScheduleEntry.preview(day: .day2, hour: 9, minute: 15)
  CampScheduleEntry.preview(day: .day2, hour: 10, minute: 35)
  CampScheduleEntry.preview(day: .day2, hour: 10, minute: 50)
  CampScheduleEntry.preview(day: .day2, hour: 12, minute: 15)
  CampScheduleEntry.preview(day: .day2, hour: 13, minute: 45)
  CampScheduleEntry.preview(day: .day2, hour: 14, minute: 45)
  CampScheduleEntry.preview(day: .day2, hour: 15, minute: 35)
  CampScheduleEntry.preview(day: .day2, hour: 15, minute: 50)
  CampScheduleEntry.preview(day: .day2, hour: 16, minute: 50)
  CampScheduleEntry.preview(day: .day2, hour: 17, minute: 5)
}

#Preview("Day 3 Timeline", as: .systemMedium) {
  CampScheduleWidget()
} timeline: {
  CampScheduleEntry.preview(day: .day3, hour: 8, minute: 30)
  CampScheduleEntry.preview(day: .day3, hour: 8, minute: 45)
  CampScheduleEntry.preview(day: .day3, hour: 9, minute: 5)
  CampScheduleEntry.preview(day: .day3, hour: 9, minute: 30)
  CampScheduleEntry.preview(day: .day3, hour: 12, minute: 30)
  CampScheduleEntry.preview(day: .day3, hour: 14, minute: 30)
  CampScheduleEntry.preview(day: .day3, hour: 16, minute: 10)
  CampScheduleEntry.preview(day: .day3, hour: 16, minute: 27)
  CampScheduleEntry.preview(day: .day3, hour: 16, minute: 35)
  CampScheduleEntry.preview(day: .day3, hour: 16, minute: 55)
  CampScheduleEntry.preview(day: .day3, hour: 17, minute: 10)
  CampScheduleEntry.preview(day: .day3, hour: 17, minute: 20)
}
