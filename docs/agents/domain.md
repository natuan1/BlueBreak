# Domain Docs

How the engineering skills should consume this repo's domain documentation when exploring the codebase.

This repo is **single-context**: one `CONTEXT.md` and one `docs/adr/` at the root.

## Before exploring, read these

- **`CONTEXT.md`** at the repo root — the domain glossary.
- **`docs/adr/`** — read ADRs that touch the area you're about to work in.

If any of these files don't exist, **proceed silently**. Don't flag their absence; don't suggest creating them upfront. The producer skill (`/grill-with-docs`) creates them lazily when terms or decisions actually get resolved.

## File structure

```
/
├── CONTEXT.md
├── docs/adr/
│   ├── 0001-pomodoro-as-subfield-of-mandatory-break-state.md
│   └── ...
├── raw/            ← original PRD and proposed architecture
└── ...
```

## `raw/` is superseded by the ADRs

`raw/prd.md` and `raw/architecture.md` are the original product and architecture documents. Several ADRs **amend** them — where an ADR conflicts with `raw/`, the ADR wins. Notably ADR-0001 and ADR-0003 change the `SessionState` shape, the checkpoint schema, and crash recovery relative to what `raw/architecture.md` describes.

Treat `raw/` as historical intent, not as current spec.

## Use the glossary's vocabulary

When your output names a domain concept (in an issue title, a refactor proposal, a hypothesis, a test name), use the term as defined in `CONTEXT.md`. Don't drift to synonyms the glossary explicitly avoids.

In particular: never write bare "break" — say **forced break** or **Pomodoro break**. Never treat Pomodoro as a top-level state; it's a sub-field (ADR-0001).

If the concept you need isn't in the glossary yet, that's a signal — either you're inventing language the project doesn't use (reconsider) or there's a real gap (note it for `/grill-with-docs`).

## Flag ADR conflicts

If your output contradicts an existing ADR, surface it explicitly rather than silently overriding:

> _Contradicts ADR-0005 (monotonic clock for live countdown) — but worth reopening because…_
