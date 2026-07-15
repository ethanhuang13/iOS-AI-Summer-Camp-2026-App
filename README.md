# iOS AI Summer Camp 2026 App

iOS AI Summer Camp 2026 時程範例 App，提供 AI coding tools 參考專案結構與實作。

## 功能

- Day 1／Day 2／Day 3 完整時程
- 顯示現在與下一個活動
- `systemMedium` 日程 Widget
- Widget Timeline 對應活動開始、結束時間
- Widget Configuration App Intent：選擇 Day 1／2／3
- App Group：App 控制 Widget 是否顯示講者
- Widget Previews
- 核心日程邏輯測試

## 開啟專案

1. 使用 Xcode 26 或更新版本開啟 `SummerCampSchedule.xcodeproj`。
2. 選擇 `SummerCampSchedule` Scheme 與 iPhone Simulator。
3. Build & Run。

若要安裝到實機，請改成自己的 Bundle ID，並在 App 與 Widget Target 加入同一個 App Group。

## 專案結構

```text
Shared/                      App 與 Widget 共用的 Model、日程與設定
SummerCampScheduleApp/       App 進入點、時程畫面、Widget 設定
CampScheduleWidget/          Intent、Provider、Entry、View、Previews
CampScheduleTests/           不依賴 UI 的日程邏輯測試
```

`project.yml` 是 XcodeGen 設定。修改 Target 或 Build Settings 後，執行：

```sh
xcodegen generate
```

## License

MIT. 詳見 [LICENSE](LICENSE)。
