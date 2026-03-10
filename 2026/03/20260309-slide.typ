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
  2026-03-09
]

=

== 本周研究摘要

#redt[完成硕士学位论文《SPN结构密码的软硬件优化实现研究》的结构性润色与规范化整理]

#bluet[重组第四篇小论文《ML-DSA Digital Signatures in Resource-Constrained MQTT Environments》的研究叙述链条]

== 硕士学位论文修改与规范化整理

#bluet[前置材料与参考文献完成定稿阶段整理]

#redt[第三章至第五章围绕术语统一、段落衔接与图文排版进行了集中修订]

== 第四篇小论文摘要与引言重组

#bluet[摘要与引言改写为面向 ARM Cortex-M4 与 MQTT 场景的三层研究框架]

摘要围绕 ML-DSA 在 ARM Cortex-M4 平台上的实现优化、面向 MQTT 的签名集成以及系统级评估展开。引言部分补入 IoT 长期运行约束、MQTT 对报文扩展敏感以及后量子签名与证书体系兼容等背景动机，并重新组织现有工作的评述方式。

#redt[论文贡献由两项调整为实现级优化、协议级集成和系统级评估三项]


= 总结

== 下周计划

下周将以ML-DSA 中模乘操作在 ARM Cortex-M4 平台上的实现优化 为主要工作

== 老师评语

*小论文一是注意我发你的审稿论文，再就是我今天发群里IEEE论文压缩包里好象有篇论文你可参考*

收到，后续将参考相关论文继续推进第四篇小论文修改
