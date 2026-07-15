import Foundation

struct ScheduleContext: Hashable, Sendable {
  let phase: Phase
  let current: ScheduleItem?
  let next: ScheduleItem?

  enum Phase: Hashable, Sendable {
    case beforeEvent
    case duringSession
    case betweenSessions
    case afterEvent
  }
}

