import SwiftUI

struct CurrentSessionCard: View {
  let day: CampDay
  let context: ScheduleContext

  var body: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack {
        VStack(alignment: .leading, spacing: 2) {
          Text(day.title.uppercased())
            .font(.caption.weight(.bold))
            .foregroundStyle(.white.opacity(0.72))
          Text(day.dateLabel)
            .font(.title3.weight(.semibold))
            .foregroundStyle(.white)
        }

        Spacer()

        Image(systemName: "sparkles")
          .font(.title2)
          .foregroundStyle(.white)
          .accessibilityHidden(true)
      }

      Divider()
        .overlay(.white.opacity(0.28))

      switch context.phase {
      case .beforeEvent:
        if let next = context.next {
          statusLine(label: "第一個活動", item: next)
        }
      case .duringSession:
        if let current = context.current {
          statusLine(label: "現在", item: current)
        }
        if let next = context.next {
          statusLine(label: "接下來", item: next, isSecondary: true)
        }
      case .betweenSessions:
        if let next = context.next {
          statusLine(label: "接下來", item: next)
        }
      case .afterEvent:
        Label("今天的活動已結束", systemImage: "checkmark.circle.fill")
          .font(.headline)
          .foregroundStyle(.white)
      }
    }
    .padding(20)
    .background(
      LinearGradient(
        colors: [Color.indigo, Color.blue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    )
    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
    .accessibilityElement(children: .combine)
  }

  private func statusLine(
    label: String,
    item: ScheduleItem,
    isSecondary: Bool = false
  ) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      Text("\(label) · \(item.timeLabel)")
        .font(.caption.weight(.semibold))
        .foregroundStyle(.white.opacity(isSecondary ? 0.62 : 0.78))
      Text(item.title)
        .font(isSecondary ? .subheadline.weight(.semibold) : .title3.weight(.bold))
        .foregroundStyle(.white.opacity(isSecondary ? 0.82 : 1))
        .lineLimit(2)
    }
  }
}

#Preview("上課進行中") {
  CurrentSessionCard(
    day: .day2,
    context: CampSchedule.context(
      for: .day2,
      at: CampCalendar.date(day: 16, hour: 9, minute: 20)
    )
  )
  .padding()
}

