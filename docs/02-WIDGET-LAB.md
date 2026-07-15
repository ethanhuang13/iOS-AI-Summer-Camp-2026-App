# 02｜Widget 實作練習

目標：理解 Widget、Provider、Timeline Entry、View、App Group 與 App Intent 各自負責什麼。

## 先找到五個入口

- `CampScheduleWidget.swift`：Widget 宣告、尺寸與 Configuration
- `CampScheduleProvider.swift`：現在與未來的 Timeline
- `CampScheduleEntry.swift`：某個時間點的畫面資料
- `CampScheduleWidgetView.swift`：根據 Entry 畫畫面
- `CampScheduleConfigurationIntent.swift`：選擇 Day 1／2／3

## 基本版驗收

- 顯示目前活動
- 顯示下一個活動與開始時間
- Timeline 至少包含三個 Entry
- Preview 能看到上課、休息、下一堂前
- 只支援 `systemMedium`

## 建議練習順序

1. Build 原始專案。
2. 請 Codex 只說明 Widget Target，不改程式。
3. 在 `CampSchedule.swift` 修改一筆 Day 2 日程。
4. 確認 App 與 Widget 都讀到相同資料。
5. 新增第四個 Preview，例如午餐或活動結束。
6. 改進 Timeline，但每個活動開始與結束只需要一個 Entry。
7. 到 App 的 Widget 設定切換「顯示講者」，觀察 App Group 資料共享。
8. 長按 Widget → 編輯 Widget，切換 Day 1／2／3。

## 進階題目（一次選一個）

- 加入 `systemSmall`，重新決定資訊層級
- App 允許收藏活動，Widget 透過 App Group 顯示收藏狀態
- 加入互動 App Intent，把目前活動標示完成

Timeline 不是精準計時器，也不是背景計時器。不要每秒建立 Entry。

