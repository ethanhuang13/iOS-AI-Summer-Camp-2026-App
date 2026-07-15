import Foundation

enum SchedulePreferences {
  static let appGroupID = "group.com.ethanhuang13.iOSAISummerCamp2026"
  static let showsSpeakersKey = "widget.showsSpeakers"

  static let defaults = UserDefaults(suiteName: appGroupID) ?? .standard

  static var showsSpeakers: Bool {
    guard defaults.object(forKey: showsSpeakersKey) != nil else {
      return true
    }

    return defaults.bool(forKey: showsSpeakersKey)
  }
}
