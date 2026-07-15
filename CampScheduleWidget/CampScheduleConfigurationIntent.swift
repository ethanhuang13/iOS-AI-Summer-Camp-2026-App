import AppIntents

struct CampScheduleConfigurationIntent: WidgetConfigurationIntent {
  static var title: LocalizedStringResource = "選擇活動日"
  static var description = IntentDescription("選擇 Widget 要顯示 Day 1、Day 2 或 Day 3。")

  @Parameter(title: "顯示日期", default: .day2)
  var day: ScheduleDayOption
}

