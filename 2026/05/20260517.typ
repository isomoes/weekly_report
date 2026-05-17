#import "@preview/basic-document-props:0.1.0": simple-page
#import "@preview/cetz:0.3.4": canvas, draw

// Chinese font configuration
#set text(
  font: (
    "Source Han Serif",
  ),
  lang: "zh",
  region: "cn",
)

// Paragraph layout - full justification with hyphenation
#set par(justify: true)
#set text(hyphenate: true)

// Document setup
#set document(title: "周报 isomo", author: "isomo", date: datetime.today())

// Page setup
#set page(
  numbering: "1",
  number-align: center,
)

// Heading styles and numbering
#set heading(numbering: "1.1")
#show heading.where(level: 1): set text(size: 16pt, weight: "bold")
#show heading.where(level: 2): set text(size: 14pt, weight: "bold")

// Citation styling - make citations blue and clickable-looking
#show cite: set text(fill: blue)

// Table caption positioning - put captions above tables
#show figure.where(kind: table): it => [
  #it.caption
  #it.body
]

// Color shorthand functions
#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)
#let yellowt(content) = text(fill: yellow, content)
#let oranget(content) = text(fill: orange, content)
#let purplet(content) = text(fill: purple, content)
#let greyt(content) = text(fill: gray, content)
#let grayt(content) = text(fill: gray, content)

// Title page
#align(center)[
  #text(size: 18pt, weight: "bold")[
    周报 向嘉豪(2026-05-17)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周围绕大论文外审与预答辩两轮评审意见，对正文 docx 进行了体系化修订，覆盖#redt[参考文献整体重排与作者姓名全拼展开、绪论国内外研究现状扩写至两页、第六章研究展望去重以及预答辩回复文档重写]，并整理生成答辩前评阅意见修改说明文档，使正文、回复材料保持一致。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  修改大论文
])

#v(1em)

= 参考文献整体重排与正文引用同步

== 修订变更接受与正文引用重编号

针对参考文献新增与删除导致的正文上下标失配，将前序所有遗留 tracked changes 全部接受并清除空段残留，按位移映射对全文 131 处正文上标引用进行重编号：编号 [1..28] 保持不变，[30..44] 整体前移 1 位，[46..67] 整体前移 2 位；同时将两处指向已删除条目的引用替换为语义最接近的现存条目，包括 Bharathi 引用改为 Lara-Nino 提出的 PRESENT 轻量级硬件架构、以及 Sovyn2021 改为 Sovyn2023 的 IEEE TIFS 比特切片 x86-64 工作。最终参考文献共 69 条（67-2+4），全文已无残留修订标记。

== 新增 2025--2026 文献正文共引

对 3-6 阶段新增的四篇 2025--2026 文献以"[N, M]"共引形式补齐正文引用：Kim2025 与 Adomnicai2021 共引于 §2.1.2 的 32 位比特切片 ARM 讨论段，Gaspoz2025 与 Sovyn2023 共引于比特切片软件实现段，Feng2025Piccolo 与 Li2021 共引于硬件架构分类段，Khan2025 与 Campos2020 共引于物联网软件实现段。#bluet[共引采用就近语义锚点策略，保证每条参考文献至少被正文引用一次，消除孤立条目。]

= 参考文献条目规范化

== 作者姓名全拼展开

依据导师对 3-9 条"作者名字写全"的澄清，将全部 63 条英文参考文献条目从 GB/T 7714-2015 的"姓 + 首字母"形式扩展为完整的名 + 姓形式，包括 ref.bib 已有的 60 条与 3-6 阶段新增的 3 条（Kim2025、Gaspoz2025、Khan2025）。条目格式上仍保留"列出前三作者后接 et al."的截断规则；6 条中文条目本就以全名呈现，未做改动。实现上采用 lxml 直接操作 DOM，避免了正则替换在多个 `w:t` run 间作者文本断裂时的失配问题。

== 期刊名缩写补齐

在重编号完成后对 docx 再次扫描，发现两条期刊名仍以缩写形式渲染：[1] Haider2026 由 "Comput." 展开为 "Computer Science Review"，并补全年份前的逗号分隔；[19] Belkheyar2023 由 "IACR Trans.Cryptogr.Hardw.Embed.Syst." 展开为 "IACR Transactions on Cryptographic Hardware and Embedded Systems"，注意到该条目缩写跨越两个 run，仅需修改后半 run。全部 69 条条目的期刊名与作者姓名格式已统一。

= 正文章节修订

== 绪论国内外研究现状扩写

外审意见 4-1 要求国内外研究现状部分扩充至两页篇幅，在 §1.2.1 硬件实现方向补充国内研究进展与剩余研究空白的分析段落，在 §1.2.3 GPU 实现方向补充共享内存优化、CUDA Stream 调度与异构平台融合等近年趋势段落，两处均以 tracked change 形式插入便于导师审阅。

== 第六章研究展望去重

针对第六章 §6.2 "研究展望"段落中"本文"一词出现频次过高的语言风格问题，按句法结构对重复指代进行替换与精简，提升段落叙述的流畅度并避免主语反复。

== 正文段落与格式手工修复

修复 docx 中若干段落属性异常导致的渲染问题，并对外审与预答辩阶段尚未自动化处理的格式细节执行了一轮手工统稿，使评审版本与提交版本在排版与编号层面对齐。

