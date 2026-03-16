# 20260316 Weekly Report Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create `2026/03/20260316.typ` in the same Typst weekly report style as `2026/03/20260309.typ`, with thesis Word-conversion and post-defense correction work as the dominant content and FourthPaper IEEE-style revision as the secondary content.

**Architecture:** Reuse the prior weekly report file as a structure-and-style template, but replace all substantive content with a new abstract, next-week plan, and two report sections tailored to this week. Keep the thesis section materially longer than the FourthPaper section, and limit highlighted text to one primary thesis emphasis and one secondary paper emphasis.

**Tech Stack:** Typst, existing weekly report template conventions, academic Chinese prose.

---

## Chunk 1: Template replication and report drafting

### Task 1: Create the new weekly report file from the approved design

**Files:**
- Create: `2026/03/20260316.typ`
- Reference: `2026/03/20260309.typ`
- Reference: `docs/superpowers/specs/2026-03-16-weekly-report-design.md`
- Reference: `paper/big_paper/tex/thesis.tex`
- Reference: `paper/FourthPaper/tex/index.tex`
- Reference: `paper/FourthPaper/tex/index-release-diff.tex`

- [ ] **Step 1: Re-read the source materials before drafting**

Inspect `20260309.typ` for style only, `thesis.tex` for thesis context, and `index.tex` plus `index-release-diff.tex` for the FourthPaper concise-revision context. Limit thesis claims to the user-provided Word-conversion categories and file-supported context.

- [ ] **Step 2: Reproduce the template scaffold**

Copy the structural setup from `2026/03/20260309.typ`, including imports, text/page/document settings, heading configuration, citation styling, table-caption handling, color helper functions, title block, abstract label, and next-week plan box.

- [ ] **Step 3: Replace date-specific metadata**

Set the title page date text to `周报 向嘉豪(2026-03-16)` while preserving the original alignment and styling pattern.

- [ ] **Step 4: Write the abstract paragraph**

Draft one paragraph that states the thesis Word-conversion and typesetting-repair work as the primary task, explicitly mentioning tables, mathematical symbols, algorithm environments, and Word-side layout correction. The same paragraph must also state that the converted Word thesis was checked and corrected against the defended thesis version, then conclude with one concise sentence for the FourthPaper IEEE-style revision.

- [ ] **Step 5: Write the next-week plan**

Add one short sentence continuing the thesis-focused work, such as checking the Word thesis manuscript for remaining formatting and text inconsistencies.

- [ ] **Step 6: Write the thesis main section**

Add a first-level section on thesis Word conversion and defense-version correction with two second-level subsections:

1. `TeX转Word版本与排版问题处理`
2. `基于答辩稿的内容核对与修订`

Ensure this section is the longest part of the report, uses paragraph-only prose without bullet-style lists, and contains the main `#redt[...]` emphasis.

- [ ] **Step 7: Write the FourthPaper secondary section**

Add a shorter first-level section on concise IEEE-style revision of `paper/FourthPaper/tex/index.tex`, referencing that the changes are reflected in `index-release-diff.tex`, using paragraph-only prose, and include at most one `#bluet[...]` emphasis.

- [ ] **Step 8: Check narrative balance before verification**

Confirm that approximately 80--90% of the substantive report text is devoted to thesis work, with the FourthPaper section remaining brief and secondary.

- [ ] **Step 9: Save the file for formal verification**

Save `2026/03/20260316.typ` with valid Typst syntax before moving to compilation and file review.

## Chunk 2: Verification

### Task 2: Verify style fidelity and content balance

**Files:**
- Read: `2026/03/20260316.typ`
- Reference: `2026/03/20260309.typ`
- Reference: `docs/superpowers/specs/2026-03-16-weekly-report-design.md`

- [ ] **Step 1: Compile the Typst file**

Run: `typst compile 2026/03/20260316.typ`
Expected: compilation succeeds without syntax errors.

- [ ] **Step 2: Compare style elements against the template**

Check that imports, font settings, paragraph settings, page numbering, heading styles, helper functions, title layout, abstract heading, and plan box all match the established style.

- [ ] **Step 3: Verify content emphasis**

Check that the thesis section occupies roughly 80--90% of the substantive report text and that the abstract also presents the thesis as the dominant workload.

- [ ] **Step 4: Verify evidence boundaries**

Check that the report does not invent unsupported low-level correction examples beyond the user-provided categories and referenced file context.

- [ ] **Step 5: Verify required structure and highlight limits**

Check that the abstract is exactly one paragraph, the thesis section has exactly two second-level subsections, the report uses paragraph-only prose, and highlight usage is limited to one `#redt[...]` and at most one `#bluet[...]`.

- [ ] **Step 6: Verify tone and wording**

Check that the prose is concise, academic, non-promotional, and free of subjective claims such as “significantly,” “greatly,” or similar self-evaluations.
