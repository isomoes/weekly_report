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
  2026-03-30
]

=

== 本周研究摘要

#redt[本周工作围绕盲审版学位论文 Word 稿修订展开，重点包括格式校正、反馈处理和学校信息脱敏]

#bluet[修改范围覆盖封面、目录、章节页码、正文段落位置、术语表达和声明页匿名化信息]

== 封面、目录与章节版式校正

#redt[重新整理封面字段排布，并核对目录编号间距及第四章、第五章页码]

调整学位类别、学院信息、学号和分类号等字段的换行与对齐，清理 `1.1.1`、`2.1`、`4.3.1` 等编号后的多余空格，并补齐个别图表附近留白。

== 正文位置与术语表达调整

#bluet[同步修订局部段落位置和章节表述，保持图表说明与正文分析对应]

将 CRAFT 面积评估说明移回与表 3-6、图 3-8 对应的位置，统一替换“本工作”等表述，并将理论意义部分改为连续段落。

=

== 冯师姐反馈处理与盲审脱敏

#redt[根据冯师姐反馈继续逐项清理问题，本轮工作以一致性检查和匿名化处理为主]

继续核对封面与声明页字段，删除盲审稿中不应保留的学院名称，并复查正文中的术语称呼、段落连接和图表说明位置。

#bluet[对原创性声明和学位论文授权使用声明中的学校名称进行星号替换，并同步检查前置页]

该部分修改直接对应盲审稿提交规范，因此与前一轮格式修订一并复核。

= 总结

== 下周计划

推进第四篇小论文

== 老师评语

*抓紧把小论文写完在暑假前投出去*

抓紧推进第四篇小论文
