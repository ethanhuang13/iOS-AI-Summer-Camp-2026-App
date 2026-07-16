import SwiftUI
import WidgetKit

struct CampScheduleWidgetView: View {
  @Environment(\.widgetFamily) private var widgetFamily

  let entry: CampScheduleEntry

  var body: some View {
    switch widgetFamily {
    case .systemSmall:
      CampScheduleSmallView(entry: entry)
    default:
      CampScheduleRegularView(entry: entry)
    }
  }
}

private struct CampScheduleSmallView: View {
  let entry: CampScheduleEntry

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      CampScheduleWidgetHeader(
        title: entry.day.title.uppercased(),
        dateLabel: entry.day.dateLabel,
        font: .caption2
      )

      switch entry.scheduleContext.phase {
      case .beforeEvent:
        if let next = entry.scheduleContext.next {
          CampScheduleSessionBlock(label: "第一個活動", item: next, isPrimary: true)
        }
      case .duringSession:
        if let current = entry.scheduleContext.current {
          CampScheduleSessionBlock(label: "現在", item: current, isPrimary: true)
        }
        if let next = entry.scheduleContext.next {
          CampScheduleSessionBlock(label: "接下來", item: next, isPrimary: false)
        }
      case .betweenSessions:
        if let next = entry.scheduleContext.next {
          CampScheduleSessionBlock(label: "接下來", item: next, isPrimary: true)
        }
      case .afterEvent:
        Spacer()
        Label("今天的活動已結束", systemImage: "checkmark.circle.fill")
          .font(.subheadline.weight(.semibold))
          .foregroundStyle(.tint)
        Spacer()
      }

      Spacer(minLength: 0)
    }
    .containerBackground(.fill.tertiary, for: .widget)
    .accessibilityElement(children: .combine)
  }
}

private struct CampScheduleRegularView: View {
  let entry: CampScheduleEntry

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      CampScheduleWidgetHeader(
        title: entry.day.title.uppercased(),
        dateLabel: entry.day.dateLabel,
        font: .caption
      )

      Divider()

      switch entry.scheduleContext.phase {
      case .beforeEvent:
        if let next = entry.scheduleContext.next {
          CampScheduleSessionBlock(
            label: "第一個活動",
            item: next,
            isPrimary: true,
            speaker: entry.showsSpeakers ? next.speaker : nil
          )
        }
      case .duringSession:
        if let current = entry.scheduleContext.current {
          CampScheduleSessionBlock(
            label: "現在",
            item: current,
            isPrimary: true,
            speaker: entry.showsSpeakers ? current.speaker : nil
          )
        }
        if let next = entry.scheduleContext.next {
          CampScheduleSessionBlock(
            label: "接下來",
            item: next,
            isPrimary: false,
            speaker: entry.showsSpeakers ? next.speaker : nil
          )
        }
      case .betweenSessions:
        if let next = entry.scheduleContext.next {
          CampScheduleSessionBlock(
            label: "接下來",
            item: next,
            isPrimary: true,
            speaker: entry.showsSpeakers ? next.speaker : nil
          )
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
}

private struct CampScheduleWidgetHeader: View {
  let title: String
  let dateLabel: String
  let font: Font

  var body: some View {
    HStack {
      Label(title, systemImage: "calendar")
        .font(font.weight(.bold))
        .foregroundStyle(.secondary)
      Spacer()
      Text(dateLabel)
        .font(font)
        .foregroundStyle(.secondary)
    }
  }
}

private struct CampScheduleSessionBlock: View {
  let label: String
  let item: ScheduleItem
  let isPrimary: Bool
  var speaker: String? = nil

  var body: some View {
    VStack(alignment: .leading, spacing: 2) {
      Text("\(label) · \(item.timeLabel)")
        .font(.caption.weight(.semibold))
        .foregroundStyle(isPrimary ? Color.accentColor : .secondary)

      Text(item.title)
        .font(isPrimary ? .headline : .subheadline.weight(.semibold))
        .lineLimit(1)

      if let speaker {
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
