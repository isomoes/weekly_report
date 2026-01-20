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
  "Source Han Serif", // Alternative Chinese serif font
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

// Additional font customization options:
#show heading: set text(font: "Source Han Sans", weight: "bold")
#show raw: set text(font: "Source Han Mono SC")

#show heading: set text(font: "Source Han Sans")
#show: simple-theme.with(aspect-ratio: "16-9", footer: [周报])

#title-slide[
  = 周报
  #v(2em)

  #v(2em)
  2026-01-19
]

=

== 本周研究摘要

#redt[硕士学位论文第一章绪论与第二章基础知识撰写完成]

#bluet[采用IEEE Trans模板 第四篇小论文，制定论文长度优化方案]

== 第一章绪论撰写

#bluet[包括选题背景及研究意义、国内外研究现状和研究内容三个部分]

- 选题背景：SPN结构密码在物联网和云计算环境中的应用需求
- 国内外研究现状：轻量级密码硬件实现、比特切片软件实现、GPU并行实现
- 研究内容：CRAFT密码FPGA实现、SPN比特切片优化、AES GPU并行优化

== 第二章基础知识撰写

#bluet[系统介绍SPN密码基本原理、软件实现技术和硬件实现技术]

- SPN密码原理：S盒变换、线性变换、AES-128四个基本操作
- 软件实现：查找表实现、比特切片实现、SIMD向量化实现
- 硬件实现：ASIC/FPGA平台、迭代/串行/展开架构

#redt[以AES-128为例详细分析SubBytes、ShiftRows、MixColumns、AddRoundKey]

== 小论文长度优化

#bluet[当前篇幅约942行，需精简约15%(139行)以满足IEEE Trans 10-12页要求]

- Related Work：精简约12行，聚焦研究空白
- ML-DSA算法描述：精简约28行，保留核心结构
- 实现架构：精简约24行，合并重复内容
- 自适应协议：精简约20行，删除冗余示例
- 实验与结果：精简约55行，合并表格与分析

= 总结

== 下周计划

- 继续撰写第三章：面向资源受限环境的CRAFT密码FPGA高效实现
- 完善第四篇小论文，按优化方案精简篇幅

== 老师评语

*第3篇小论文精简到不超过13页，最好就是12页以内，简洁表达是现在所有写作均要求的，包括国家自然科学基金申报都作了硬性规定页数限制
  trans论文免费页数实际就是他们希望一篇论文的长度，一般不得超过期免费长度2页*

精简到12页内
