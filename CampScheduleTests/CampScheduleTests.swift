import Foundation
import Testing

@Suite("Summer Camp schedule")
struct CampScheduleTests {
  @Test("Day 2 includes the collaboration lesson")
  func day2IncludesCollaborationLesson() {
    let lesson = CampSchedule.day2.first { $0.startDate == date(day: 16, hour: 10, minute: 45) }

    #expect(lesson?.title == "團隊分工與協作")
    #expect(lesson?.durationMinutes == 75)
  }

  @Test("The break is current at 10:35 and collaboration is next")
  func contextDuringBreak() {
    let context = CampSchedule.context(
      for: .day2,
      at: date(day: 16, hour: 10, minute: 35)
    )

    #expect(context.phase == .duringSession)
    #expect(context.current?.title == "休息")
    #expect(context.next?.title == "團隊分工與協作")
  }

  @Test("The event is finished after the final Day 3 session")
  func contextAfterEvent() {
    let context = CampSchedule.context(
      for: .day3,
      at: date(day: 17, hour: 18, minute: 0)
    )

    #expect(context.phase == .afterEvent)
    #expect(context.current == nil)
    #expect(context.next == nil)
  }

  private func date(day: Int, hour: Int, minute: Int) -> Date {
    CampCalendar.date(day: day, hour: hour, minute: minute)
  }
}

