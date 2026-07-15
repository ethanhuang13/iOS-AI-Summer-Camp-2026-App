# 03｜多人 GitHub 協作

目標：所有組員從同一個 Repository 工作，以 Branch、Commit、Pull Request 合作，不互傳整包專案。

## 隊長

1. 建立 private GitHub repository。
2. Push 可 Build 的 `main`。
3. 邀請 Collaborators。
4. 指定一人負責 Xcode Target、Signing、Capability。

## 組員

1. 接受邀請後 Clone。
2. Build `main`，確認起點一致。
3. 從最新 `main` 建立 `feature/＿＿＿＿`。
4. 只改分配到的檔案範圍。
5. 看 Diff、Build、Commit、Push。
6. 建立 Pull Request，不直接改 `main`。

## 本專案的第一輪分工

- A：改善 `ScheduleRow.swift`
- B：在 Widget 新增「活動結束」Preview
- C：在 `CampScheduleTests.swift` 增加一個 Day 1 測試
- D：檢查 VoiceOver、Dynamic Type，修改一個獨立 View

第一輪不要同時改 `project.yml`、`.pbxproj` 或同一份時程資料。先練習低衝突協作，再處理真正的功能分工。

## Pull Request 驗收

- 改動範圍符合分工
- 沒有 Build 產物、個人設定或 Secrets
- App／Widget 能 Build
- 日程邏輯測試通過
- PR 說明包含測試方法與畫面變化

