#import "@preview/touying:0.6.1": *
#import themes.simple: *
#import "@preview/cetz:0.3.2"
#import "@preview/fletcher:0.5.5" as fletcher: edge, node
#import "@preview/numbly:0.1.0": numbly
#import "@preview/theorion:0.3.2": *
#import cosmos.clouds: *
#show: show-theorion

// cetz and fletcher bindings for touying
#let cetz-canvas = touying-reducer.with(reduce: cetz.canvas, cover: cetz.draw.hide.with(bounds: true))
#let fletcher-diagram = touying-reducer.with(reduce: fletcher.diagram, cover: fletcher.hide)

// Set Chinese fonts for the presentation
#set text(font: (
  "Source Han Serif",
))

// Color shorthand functions
#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)
#let yellowt(content) = text(fill: yellow, content)
#let oranget(content) = text(fill: orange, content)
#let purplet(content) = text(fill: purple, content)
#let greyt(content) = text(fill: gray, content)
#let grayt(content) = text(fill: gray, content)

// Additional font customization options
#show heading: set text(font: "Source Han Sans", weight: "bold")
#show raw: set text(font: "Source Han Mono SC")

#show heading: set text(font: "Source Han Sans")
#show: simple-theme.with(aspect-ratio: "16-9", footer: [周报])

#title-slide[
  = 周报
  #v(2em)

  #v(2em)
  2026-03-16
]

=

== 本周研究摘要

#redt[本周工作围绕学位论文 `thesis.tex` 对应 Word 稿的结构整理与排版修订展开]

#bluet[同步对 FourthPaper 按 IEEE 风格进行压缩，修改集中在摘要、引言和背景三部分]

== 学位论文 Word 版本整理

#redt[按主文档结构重整中英文摘要、目录、6 章正文及 2 个后置章节]

Word 稿整理围绕标题层级、编号关系与页面版式展开，并逐段处理由 TeX 转换带来的结构偏移问题。

== 表格、公式与算法版式修正

#bluet[重点修正表格位置、数学符号显示形式与算法标题步骤版式]

本轮处理主要针对转换后最易失真的表格、公式和算法环境，统一其与版心、章节结构及正文叙述之间的对应关系。

== 答辩稿核对与 FourthPaper 压缩修订

#redt[继续对照答辩通过版本核查文本、符号与页面格式的一致性]

同时对 FourthPaper 执行 IEEE 风格文字压缩，处理长句收缩、重复限定语删除及部分连接表达替换，修改集中在摘要、引言和背景三部分。

= 总结

== 下周计划

下周将继续检查学位论文 Word 版本中的表格、公式与算法排版问题，并进一步核对整体格式一致性。

== 老师评语

*不要什么都用latex，好象word就不会用了样。工具是增加我们效率，那个效率高我就用那个，而不是固定只用某个*

好的 老师
