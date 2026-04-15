# Audit: swift-iso-9899

## Legacy — Consolidated 2026-04-08

### From: swift-institute/Research/audit-standards-p2.md (2026-04-03)

**Pre-publication audit — P0/P1/P2 checks**

#### P0: Foundation Imports [PRIM-FOUND-001]

**Result: PASS** — No `import Foundation` in any Sources/ directory.

#### P1: Multi-Type Files [API-IMPL-005]

**Result: FAIL — 2 files**

| # | Severity | Rule | Location | Finding | Action |
|---|----------|------|----------|---------|--------|
| 1 | P1 | API-IMPL-005 | `Sources/ISO 9899 Core/ISO_9899.Errno.swift:223` | `Require` enum is a sibling namespace alongside `Errno` (line 37) and nested `Code` (line 83). Three types in one file. | Extract `Require` to `ISO_9899.Errno.Require.swift` |
| 2 | P1 | API-IMPL-005 | `Sources/ISO 9899 Core/ISO_9899.String.Copy.swift` | Three sibling namespaces: `Copy` (line 26), `Concatenation` (line 104), `Length` (line 168). `ISO_9899.String.Length.swift` already exists but the `Length` enum in Copy.swift declares the C-wrapper version. | Extract `Concatenation` to `ISO_9899.String.Concatenation.swift`; reconcile `Length` duplication |

#### P1: Compound Type Names [API-NAME-001]

**Result: FAIL — 1 type**

| # | Severity | Rule | Location | Finding | Action |
|---|----------|------|----------|---------|--------|
| 3 | P1 | API-NAME-001 | `Sources/.../ISO_9899.Math.Classification.swift:19` | `FloatingPointClass` — compound name | Rename to `FloatingPoint.Class` or `Class` (nested under `Math`) |

#### P2: Methods in Type Bodies [API-IMPL-008]

**Result: PASS** — Types contain only stored properties, enum cases, or deinit in their bodies. Methods and computed properties are in extensions.

#### P3: Missing Doc Comments [DOC-001]

**Result: FAIL — 2 declarations**

| # | Severity | Rule | Location | Finding |
|---|----------|------|----------|---------|
| 4 | P3 | DOC-001 | `Sources/.../ISO_9899.Errno.swift:84` | `public let rawValue: Int32` — missing doc comment |
| 5 | P3 | DOC-001 | `Sources/.../ISO_9899.Errno.swift:87` | `public init(rawValue: Int32)` — missing doc comment |

#### Additional Observations

- `ISO_9899.swift` (line 66) declares `public typealias C = ISO_9899` at module scope. Convenience alias that may shadow in consumer code. Not a convention violation.

#### Summary

| Check | Result | Count |
|-------|--------|-------|
| P0: Foundation imports | PASS | 0 |
| P1: Multi-type files | FAIL | 2 files |
| P1: Compound type names | FAIL | 1 type |
| P2: Methods in type bodies | PASS | 0 |
| P3: Missing doc comments | FAIL | 2 declarations |
