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

#set text(font: (
  "Source Han Serif",
))

#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)
#let yellowt(content) = text(fill: yellow, content)
#let oranget(content) = text(fill: orange, content)
#let purplet(content) = text(fill: purple, content)
#let greyt(content) = text(fill: gray, content)
#let grayt(content) = text(fill: gray, content)

#show heading: set text(font: "Source Han Sans", weight: "bold")
#show raw: set text(font: "Source Han Mono SC")

#show heading: set text(font: "Source Han Sans")
#show: simple-theme.with(aspect-ratio: "16-9", footer: [周报])

#title-slide[
  = 周报
  #v(2em)

  #v(2em)
  2026-05-11
]

=

== 本周摘要

#redt[围绕大论文外审意见修改与预答辩材料整理展开。]

#bluet[修改集中在绪论研究现状、第六章跨平台讨论、AES listing 压缩与参考文献规范化，并完成评审回复文档与预答辩 PPT 评审回复章节。]

== 正文修改

绪论按 FPGA 轻量级实现、32 位嵌入式位切片优化与 GPU 并行实现三方向重写综述，新增约 800 字并补文献，弱化"首次"等绝对化表述。第六章新增跨平台实用性取舍与功耗/电磁/时间侧信道展望两段。AES ShiftRows listing 压缩排版，新增 6 篇高水平中文期刊文献并完成正文引用，对齐 docx 与 PDF 版本。

== 评审回复、PPT 与下一轮修订

评审回复文档按"感谢意见、修改位置、修改内容、原文蓝色标注"统一结构组织两位专家全部条目；预答辩 PPT 新增 review-response 章节逐条对应外审意见，封面与页眉补学校 logo，成果页扩展为完整引用形式。

导入老师 docx 9 处批注与预答辩评审意见表 10 项条目，已完成封面导师职称、致谢、中科院分区展开、Springer 会议规范化、参考文献补齐、缩写规范化、预警/OA 标记、2025--2026 文献补充、公式加粗渲染与绪论衔接桥段。

= 总结

== 下周计划

#bluet[大论文修改 答辩材料准备]

== 老师评语

*人走下坡路只要不动就自动下滑，上坡才难走，但山顶的风光是山脚无法比拟的 要加快完成最后一篇论文*

好的 老师
