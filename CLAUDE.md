# BlueBreak

macOS menu bar Pomodoro and break reminder. Native Swift, SwiftUI + AppKit, local-first, no backend.

Product requirements and proposed architecture live in `raw/`. Note that several decisions in `docs/adr/` amend the original architecture doc — the ADRs win where they conflict.

## Agent skills

### Issue tracker

Issues live as GitHub issues in `natuan1/BlueBreak`, managed via the `gh` CLI. See `docs/agents/issue-tracker.md`.

### Triage labels

Canonical label names, used unchanged. See `docs/agents/triage-labels.md`.

### Domain docs

Single-context: `CONTEXT.md` and `docs/adr/` at the repo root. See `docs/agents/domain.md`.
