# Contributing

## Workflow

1. `git switch main`
2. `git pull --ff-only`
3. `git switch -c feature/<short-name>`
4. 完成一個小而可驗證的改動
5. Build、Test、檢查 Diff
6. Commit、Push、開 Pull Request

## Scope

- 一個 Commit 只處理一個目的。
- 不格式化或重寫不在分工範圍的檔案。
- 不提交 `xcuserdata`、DerivedData、Secrets。
- Xcode Target、Signing、Capability 由指定組員負責。
- 不直接 Push `main`。

## Definition of Done

- `SummerCampSchedule` 可編譯。
- `CampScheduleTests` 通過。
- 新增或修改的 SwiftUI View 有 Preview。
- PR 交代改動、驗證與風險。

