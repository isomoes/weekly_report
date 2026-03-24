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
  2026-03-23
]

=

== 本周研究摘要

#redt[本周工作继续围绕硕士学位论文 Word 版本的版式整理与细节修订展开]

#bluet[根据冯师姐对 Word 稿的批注意见，逐项调整表格位置、关键词表述与局部排版顺序]

== 学位论文 Word 版本整体布局整理

#redt[处理范围覆盖中英文摘要、目录、正文各章及后置部分，重点核对章节层级、标题编号与页面结构]

本周继续检查转换后的样式偏移问题，逐项调整标题格式、正文缩进、分页位置与目录映射关系，并重新整理部分段落顺序。

== 批注意见整理与对应修改

#redt[继续整理冯师姐对 Word 版本的批注，修改重点包括术语统一、关键词替换与表格邻接关系调整]

对属于格式层面的问题，主要通过标题样式和表格前后布局进行处理；对属于表述层面的问题，则以术语一致和语义准确为目标完成修订。

= 总结

== 下周计划

下周将继续检查学位论文 Word 版本中的章节格式、表格和公式版式，并进一步核对整体排版一致性。
