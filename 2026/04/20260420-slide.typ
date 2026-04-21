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
  2026-04-20
]

=

== 本周研究摘要

#redt[本周工作围绕第四篇论文正文澄清与文献整理展开，重点重写实现部分、MQTT 集成表述与实验讨论]

#bluet[稿件主线已收束为“资源受限设备上的 ML-DSA 实现、面向 MQTT 的签名封装与部署代价评估”]

== 研究定位与正文结构调整

#redt[补充后量子迁移、资源受限约束与 MQTT 认证需求之间的递进关系，并将论文定位收束到部署问题分析]

新增嵌入式实现、迁移工程与协议部署相关文献，用于说明本文关注的是标准化签名方案在受限消息系统中的实现代价、消息开销与部署边界。

== 实现逻辑、实验解释与文献整理

#bluet[实现部分与 MQTT 集成部分已按统一叙述链条重写，从关键运算组织过渡到应用层消息封装]

当前稿件将签名时延 663--1,136 ms、验证时延 420--710 ms、消息负载 2,478--4,685 B、端到端时延 1,114--1,883 ms，以及 SRAM 22.7--43.1 KB 和 Flash 37.2--73.9 KB 置于同一部署解释框架中，并同步补充实现优化、迁移问题与协议部署三类文献背景。

= 总结

== 下周计划

继续优化 ML-DSA 实现，重点分析核心算术路径、签名主循环与资源开销，并结合现有评测结果压缩时延与存储占用。

== 老师评语

*用一句话总结你的创新点和可能对比优势*

#bluet[据当前文献梳理，这是面向 MQTT 场景开展后量子 ML-DSA 迁移工作的首次系统化实现、集成与评测。]
