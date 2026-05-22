# Codex Conversation Notes

Date: 2026-05-22

## Request

用户希望查看并修改 `RioArisk/codex-auth-manager`，把项目里保存的 JSON 凭据从明文存储改成加密存储。

## Repository

- Source: https://github.com/RioArisk/codex-auth-manager.git
- Local checkout after move: `C:\Users\1\Desktop\project\codex-auth-manager`

## Work Completed

- Cloned the repository locally.
- Located the Tauri/Rust backend file IO paths for:
  - `%LOCALAPPDATA%\codex-manager\accounts.json`
  - `%USERPROFILE%\.codex_manager\auths\{accountId}.json`
  - `%LOCALAPPDATA%\codex-manager\usage-bindings.json`
- Added Windows DPAPI current-user encryption for the manager-owned JSON files.
- Kept `%USERPROFILE%\.codex\auth.json` as official Codex-compatible plaintext, because the Codex CLI must read it directly.
- Added migration behavior: old plaintext JSON files are read successfully and then rewritten in encrypted format.
- Updated README data/privacy notes.

## Verification

- `cargo check` passed.
- `npm.cmd run build` passed.
- `git diff --check` passed.

## Local Commits

- `40e147b Encrypt local manager JSON storage`

