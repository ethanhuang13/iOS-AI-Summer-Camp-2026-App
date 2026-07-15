import SwiftUI
import WidgetKit

struct WidgetSettingsScreen: View {
  @AppStorage(
    SchedulePreferences.showsSpeakersKey,
    store: SchedulePreferences.defaults
  ) private var showsSpeakers = true

  var body: some View {
    List {
      Section {
        Toggle("Widget 顯示講者", isOn: $showsSpeakers)
      } header: {
        Text("App Group 示範")
      } footer: {
        Text("App 與 Widget 透過同一個 App Group UserDefaults 讀寫這項設定。")
      }

      Section("課程練習") {
        Label("切換後重新整理 Widget Timeline", systemImage: "arrow.triangle.2.circlepath")
        Label("在 Widget 編輯畫面選擇 Day 1／2／3", systemImage: "slider.horizontal.3")
      }
    }
    .navigationTitle("Widget 設定")
    .onChange(of: showsSpeakers) {
      WidgetCenter.shared.reloadTimelines(ofKind: "CampScheduleWidget")
    }
  }
}

#Preview {
  NavigationStack {
    WidgetSettingsScreen()
  }
}
