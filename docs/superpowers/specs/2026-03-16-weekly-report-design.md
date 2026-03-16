# 2026-03-16 Weekly Report Design

## Goal

Create `2026/03/20260316.typ` in the same Typst weekly report style as `2026/03/20260309.typ`, with the weekly narrative dominated by the thesis-related work.

## Source Context

- Style reference: `2026/03/20260309.typ`
- Main workload source: `paper/big_paper/tex/thesis.tex`
- Secondary workload source: `paper/FourthPaper/tex/index.tex`
- Concise revision evidence: `paper/FourthPaper/tex/index-release-diff.tex`
- Authoritative narrative supplement: the user's request in this session, which explicitly states that the major work was converting the thesis from TeX to Word, spending substantial time on tables, mathematical symbols, algorithms, and related Word-side typesetting fixes, followed by corrections based on the defended thesis version.

## Evidence Boundary

The weekly report should be grounded in two evidence types only:

1. File-level context from the referenced thesis and FourthPaper sources.
2. The user-provided task description as the authoritative summary of the thesis Word-conversion workload and post-defense correction scope.

No extra technical details should be invented beyond these inputs. If a specific correction item cannot be supported by the files or the user narrative, it should be described at the level of category rather than fabricated as a precise example.

## Content Priority

The report should present the thesis work as the dominant activity, accounting for roughly 80--90\% of the narrative emphasis. The FourthPaper revision should remain visible but clearly secondary.

## Report Structure

### Header and Layout

Reuse the existing Typst template structure from `20260309.typ`, including document setup, page setup, heading configuration, color helper functions, title layout, abstract label, and next-week plan box. Style fidelity should preserve the same Chinese font setup, paragraph justification, hyphenation setting, citation coloring, and table-caption placement behavior defined in the reference file.

### Abstract

Write one compact paragraph that summarizes two tasks:

1. The primary task: converting the LaTeX thesis into a Word version and repairing Word-side typesetting problems.
2. The secondary task: revising the FourthPaper manuscript into a more concise IEEE-style expression, reflected in `index-release-diff.tex`.

The abstract should explicitly mention that most time was spent on difficult format conversion issues, especially tables, mathematical symbols, algorithm formatting, and other TeX-to-Word layout adjustments. It should also state that the Word manuscript was further corrected against the defended thesis version. Content derived from `paper/big_paper/tex/thesis.tex` must be limited to conversion-related and post-defense correction-related work only, rather than unrelated thesis-writing details.

### Next-Week Plan

Keep the plan short and practical. It should continue the thesis-focused thread, such as checking the Word thesis version for remaining formatting inconsistencies and continuing final text correction.

### Section 1: Thesis Work

Section title should make clear that the main work involved thesis Word conversion and post-defense revision. The section should contain two subsections:

- **TeX-to-Word conversion and typesetting repair**: describe the high-effort formatting work, especially tables, mathematical symbols, algorithm environments, and layout adaptation from LaTeX to Word.
- **Correction based on defended thesis**: describe how the converted Word version was checked against the defended thesis and how mismatches, wording issues, or formatting inconsistencies were corrected.

This section should contain the strongest highlighted sentence using `#redt`. It should also be materially longer than the FourthPaper section so that the report emphasis is evident from section length as well as wording.

### Section 2: FourthPaper Revision

Keep this section short. Focus on concise IEEE-style language revision in `index.tex`, and indicate that the changes are reflected in `index-release-diff.tex`. Emphasize compression of wording and clearer academic expression rather than broad structural rewrite.

This section may contain one secondary highlighted sentence using `#bluet`.

## Style Constraints

- Use Chinese academic weekly-report prose.
- Avoid subjective self-evaluation.
- Convert all content into coherent paragraphs rather than bullet lists.
- Use precise terms such as 表格、数学符号、算法环境、排版错误、IEEE写作风格.
- Keep highlighting sparse: one `#redt`, one `#bluet` at most.
- Use `20260309.typ` as a style-only reference. Do not reuse or paraphrase its prior-week substantive content.

## Success Criteria

- `2026/03/20260316.typ` matches the visual and structural style of `20260309.typ`.
- The thesis conversion/fix work is clearly the dominant weekly contribution.
- The thesis section occupies substantially more text than the FourthPaper section.
- The report reflects the actual workload: heavy effort on Word conversion details, limited effort on FourthPaper.
- The language remains concise, technical, and suitable for a weekly report.
