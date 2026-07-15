# Agent Instructions

- 優先使用繁體中文（台灣用語）。
- 保持 App、Widget、Shared、Tests 的責任邊界。
- App 與 Widget 共享資料時，修改 `Shared/`，不要複製模型。
- Widget 只支援 `systemMedium`，除非任務明確要求新增尺寸。
- Timeline 以活動開始與結束為更新點，不建立每秒 Entry。
- SwiftUI View 保留可獨立顯示的 `#Preview`。
- 不修改 Bundle ID、Signing、Entitlements 或 `project.yml`，除非任務明確要求。
- Commit 前先檢查 Diff，保留使用者既有變更。
