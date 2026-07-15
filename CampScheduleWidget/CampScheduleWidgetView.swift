import SwiftUI
import WidgetKit

struct CampScheduleWidgetView: View {
  let entry: CampScheduleEntry

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Label(entry.day.title.uppercased(), systemImage: "calendar")
          .font(.caption.weight(.bold))
          .foregroundStyle(.secondary)
        Spacer()
        Text(entry.day.dateLabel)
          .font(.caption)
          .foregroundStyle(.secondary)
      }

      Divider()

      switch entry.scheduleContext.phase {
      case .beforeEvent:
        if let next = entry.scheduleContext.next {
          sessionBlock(label: "第一個活動", item: next, isPrimary: true)
        }
      case .duringSession:
        if let current = entry.scheduleContext.current {
          sessionBlock(label: "現在", item: current, isPrimary: true)
        }
        if let next = entry.scheduleContext.next {
          sessionBlock(label: "接下來", item: next, isPrimary: false)
        }
      case .betweenSessions:
        if let next = entry.scheduleContext.next {
          sessionBlock(label: "接下來", item: next, isPrimary: true)
        }
      case .afterEvent:
        Spacer()
        Label("今天的活動已結束", systemImage: "checkmark.circle.fill")
          .font(.headline)
          .foregroundStyle(.tint)
        Spacer()
      }

      Spacer(minLength: 0)
    }
    .containerBackground(.fill.tertiary, for: .widget)
    .accessibilityElement(children: .combine)
  }

  private func sessionBlock(
    label: String,
    item: ScheduleItem,
    isPrimary: Bool
  ) -> some View {
    VStack(alignment: .leading, spacing: 2) {
      Text("\(label) · \(item.timeLabel)")
        .font(.caption.weight(.semibold))
        .foregroundStyle(isPrimary ? Color.accentColor : .secondary)

      Text(item.title)
        .font(isPrimary ? .headline : .subheadline.weight(.semibold))
        .lineLimit(1)

      if entry.showsSpeakers, let speaker = item.speaker {
        Text(speaker)
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
  }
}

#Preview("上課進行中") {
  CampScheduleWidgetView(entry: .preview(day: .day2, hour: 9, minute: 15))
    .frame(width: 340, height: 160)
    .padding()
}

