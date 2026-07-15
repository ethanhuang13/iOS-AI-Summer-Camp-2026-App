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
    .supportedFamilies([.systemMedium])
  }
}

#Preview("09:15 上課中", as: .systemMedium) {
  CampScheduleWidget()
} timeline: {
  CampScheduleEntry.preview(day: .day2, hour: 9, minute: 15)
}

#Preview("10:35 休息", as: .systemMedium) {
  CampScheduleWidget()
} timeline: {
  CampScheduleEntry.preview(day: .day2, hour: 10, minute: 35)
}

#Preview("10:43 下一堂前", as: .systemMedium) {
  CampScheduleWidget()
} timeline: {
  CampScheduleEntry.preview(day: .day2, hour: 10, minute: 43)
}

