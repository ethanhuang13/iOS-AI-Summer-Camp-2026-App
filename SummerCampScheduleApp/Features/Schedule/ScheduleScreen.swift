import SwiftUI

struct ScheduleScreen: View {
  @State private var selectedDay = CampDay.closest(to: .now)

  var body: some View {
    NavigationStack {
      TimelineView(.periodic(from: .now, by: 60)) { timeline in
        ScrollView {
          LazyVStack(spacing: 14) {
            dayPicker

            CurrentSessionCard(
              day: selectedDay,
              context: CampSchedule.context(for: selectedDay, at: timeline.date)
            )

            ForEach(CampSchedule.items(for: selectedDay)) { item in
              ScheduleRow(
                item: item,
                isCurrent: timeline.date >= item.startDate && timeline.date < item.endDate
              )
            }
          }
          .padding(.horizontal)
          .padding(.bottom, 32)
        }
        .background(Color(.systemGroupedBackground))
      }
      .navigationTitle("Summer Camp 2026")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink {
            WidgetSettingsScreen()
          } label: {
            Label("Widget 設定", systemImage: "gearshape")
          }
        }
      }
    }
  }

  private var dayPicker: some View {
    Picker("活動日", selection: $selectedDay) {
      ForEach(CampDay.allCases) { day in
        Text(day.title).tag(day)
      }
    }
    .pickerStyle(.segmented)
    .padding(.vertical, 8)
  }
}

#Preview("Day 2") {
  ScheduleScreen()
}

