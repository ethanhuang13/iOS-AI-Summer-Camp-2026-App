# iOS AI Summer Camp 2026 App

iOS AI Summer Camp 三日活動時程範例。包含一個 SwiftUI App、一個 Widget Extension、共享資料與測試；同時作為 Day 2「Apple 原生框架、Widget 開發、版本控制與團隊合作」課程素材。

## 功能

- Day 1／Day 2／Day 3 完整時程
- 顯示現在與下一個活動
- `systemMedium` 日程 Widget
- Widget Timeline 對應活動開始、結束時間
- Widget Configuration App Intent：選擇 Day 1／2／3
- App Group：App 控制 Widget 是否顯示講者
- 三個 Widget Preview 時間點
- 核心日程邏輯測試

## 開啟專案

1. 安裝 Xcode 26 或更新版本。
2. 開啟 `SummerCampSchedule.xcodeproj`。
3. 選擇 `SummerCampSchedule` Scheme 與 iPhone Simulator。
4. Build & Run。

Simulator 不需要設定開發團隊。若要安裝到實機，請先改成自己的 Bundle ID，並在 App 與 Widget Target 加入同一個 App Group。

## 專案結構

```text
Shared/                      App 與 Widget 共用的 Model、日程與設定
SummerCampScheduleApp/       App 進入點、時程畫面、Widget 設定
CampScheduleWidget/          Intent、Provider、Entry、View、Previews
CampScheduleTests/           不依賴 UI 的日程邏輯測試
docs/                        三堂課的實作講義與 Prompts
```

`project.yml` 是 XcodeGen 設定；一般上課只要使用已提交的 `.xcodeproj`。若修改 Target 或 Build Settings，執行：

```sh
xcodegen generate
```

## 適合的團隊分工

| 工作 | 建議檔案範圍 |
| --- | --- |
| App 時程畫面 | `SummerCampScheduleApp/Features/Schedule/` |
| Widget Timeline 與 Preview | `CampScheduleWidget/` |
| 時程資料與判斷邏輯 | `Shared/`、`CampScheduleTests/` |
| 文件、無障礙與驗收 | `docs/`、獨立 View |

第一輪刻意避免多人同時修改 `project.yml` 或 `.xcodeproj/project.pbxproj`。Target、Signing、Capability 由一位組員負責。

## 課程入口

1. [Apple 原生框架研究](docs/01-APPLE-FRAMEWORK-RESEARCH.md)
2. [Widget 實作練習](docs/02-WIDGET-LAB.md)
3. [多人 GitHub 協作](docs/03-TEAM-COLLABORATION-LAB.md)
4. [可直接交給 Codex 的 Prompts](docs/PROMPTS.md)

## 資料來源

日程依 iOS AI Summer Camp 2026 課程投影片整理；日期為 2026 年 7 月 15–17 日，時區為 Asia/Taipei。

