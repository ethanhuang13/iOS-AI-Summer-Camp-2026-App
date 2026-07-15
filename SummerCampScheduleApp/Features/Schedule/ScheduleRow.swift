import SwiftUI

struct ScheduleRow: View {
  let item: ScheduleItem
  let isCurrent: Bool

  var body: some View {
    HStack(alignment: .top, spacing: 14) {
      Text(item.timeLabel)
        .font(.system(.body, design: .monospaced, weight: .semibold))
        .foregroundStyle(isCurrent ? Color.accentColor : .secondary)
        .frame(width: 58, alignment: .leading)

      VStack(alignment: .leading, spacing: 5) {
        HStack(spacing: 8) {
          Text(item.title)
            .font(.headline)
            .foregroundStyle(.primary)

          if isCurrent {
            Text("NOW")
              .font(.caption2.weight(.black))
              .foregroundStyle(.white)
              .padding(.horizontal, 7)
              .padding(.vertical, 3)
              .background(Color.accentColor, in: Capsule())
          }
        }

        HStack(spacing: 8) {
          if let speaker = item.speaker {
            Label(speaker, systemImage: "person.fill")
          }
          Text(item.durationLabel)
        }
        .font(.caption)
        .foregroundStyle(.secondary)
      }

      Spacer(minLength: 0)
    }
    .padding(16)
    .background(Color(.secondarySystemGroupedBackground))
    .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    .overlay {
      if isCurrent {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .stroke(Color.accentColor, lineWidth: 2)
      }
    }
    .accessibilityElement(children: .combine)
  }
}

#Preview("現在") {
  ScheduleRow(item: CampSchedule.day2[1], isCurrent: true)
    .padding()
}

