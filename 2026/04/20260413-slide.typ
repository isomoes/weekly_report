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
  2026-04-13
]

=

== 本周研究摘要

#redt[本周工作围绕第四篇论文的正文撰写与章节重组展开]

#bluet[本轮重写将全文主线收束为 “Cortex-M4 上的 ML-DSA 实现优化、MQTT 场景下的签名集成、以及系统级部署评测” 三段式结构]

== 叙事主线与章节结构整理

#redt[引言、背景、实现设计、实验评测与结论已按同一部署问题链条重新组织]

前半部分围绕量子计算带来的 IoT 公钥迁移压力，重新建立 ML-DSA、MQTT 与资源受限设备之间的关系；后半部分则将实现细节、协议设计和实验结果整理为从实现到部署的连续叙述。

== 实现设计与 MQTT 集成

#redt[实现章节已从代码记录整理为可复现实验设置，实验平台为 STM32F407VG + ESP32-WROOM-32]

#bluet[协议集成部分采用负载内嵌的 TLV 结构，在不修改 broker 行为的前提下完成签名封装与订阅端验证]

= 总结

== 下周计划

推进Cortex-M4 上的 ML-DSA 实现优化

== 老师评语

*你的工作报告我先不说质量如何？就单内容就缺一重要部分
反复讲不听的学生，那就自己好自为之*

后续改正
