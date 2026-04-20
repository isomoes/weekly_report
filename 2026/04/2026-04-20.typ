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
    周报 向嘉豪(2026-04-20)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作主要围绕第四篇论文的正文澄清与文献整理展开，重点修订实现部分、MQTT 集成表述与参考文献背景。修改过程中将论文主线收束为#redt[“资源受限设备上的 ML-DSA 实现、面向 MQTT 的签名封装与部署代价评估”三部分]，并补充相关研究背景，统一迁移语境、实现语境与协议语境之间的衔接关系，使问题提出、方法描述与实验讨论保持一致。当前稿件的重点已转向实现逻辑、消息封装边界与研究定位的明确化。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  继续优化 ML-DSA 实现，重点分析核心算术路径、签名主循环与资源开销，并结合现有评测结果进一步压缩时延与存储占用。
])

#v(1em)

= 第四篇论文正文澄清与文献整理

== 研究背景与问题定位补充

本周首先补充论文前半部分的研究背景，使后量子迁移需求、资源受限设备约束与 MQTT 场景下的认证问题形成更清晰的递进关系。相关修改主要增加嵌入式实现、迁移工程与协议部署方面的研究脉络，用于说明本文关注的不仅是算法性能评测，还包括标准化签名方案在实际消息系统中的部署边界。同时，研究空缺进一步聚焦为受限设备上的实现代价与协议层消息开销对部署可行性的共同影响。#bluet[本轮调整的重点是将论文定位收束为部署问题分析。]

== 实现逻辑与 MQTT 封装关系重写

本周继续重写实现部分与 MQTT 集成部分之间的衔接关系，使论文从算法结构说明过渡到应用层消息封装。实现部分重点整理标准流程下的关键运算组织与重复状态复用逻辑，通信部分则围绕不修改 broker 行为的前提，说明签名、标识信息与新鲜性字段如何通过应用层封装进入发布订阅链路。经此调整，实现过程与通信过程之间的关系更加明确，并为后续系统级评测与部署分析提供了统一前提。

= 实验结果解释与部署讨论整理

== 关键指标与部署含义衔接

本周继续整理实验章节中的主要指标，使计算开销、消息膨胀、端到端时延与存储占用能够回扣前文提出的部署问题。当前稿件将三组参数下的签名时延 663--1,136 ms、验证时延 420--710 ms、消息扩展后负载 2,478--4,685 B、端到端时延 1,114--1,883 ms，以及 SRAM 22.7--43.1 KB、Flash 37.2--73.9 KB 的资源占用置于统一解释框架中，用于说明标准化 ML-DSA 在 MQTT 受限环境中的主要代价来源。#redt[实验结果的呈现重点已由单项数值罗列转向对部署瓶颈、参数差异与系统约束的连续说明。]

== 文献语境补充与后续工作整理

本周还对参考文献部分进行了补充整理，以明确实现优化、迁移问题与协议部署三类相关工作的来源关系。新增与替换后的文献主要用于支撑嵌入式实现、迁移工程、硬件加速与协议层研究的背景说明，从而增强正文研究定位的外部依据。在此基础上，论文结尾继续保留参数集选择、消息聚合、混合认证与硬件加速等后续方向，并将下一阶段工作重点进一步收束到 ML-DSA 实现优化。
