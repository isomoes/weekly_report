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
    周报 向嘉豪(2026-04-13)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作主要围绕第四篇论文 `ML-DSA Digital Signatures in Resource-Constrained MQTT Environments` 的正文撰写与结构整理展开，重点完成了引言、背景、实现设计、实验评测与结论等主体内容的连贯化重写。写作过程中将论文主线明确整理为#redt[“Cortex-M4 上的 ML-DSA 实现优化、MQTT 场景下的签名集成、以及系统级部署评测”三段式结构]，并把实验章节中的关键指标统一到同一叙事框架下，包括签名延迟、验证延迟、消息膨胀、端到端时延与存储开销。与此同时，对部署可行性分析部分补充了高吞吐传感网络、电池供电设备和实时控制系统三类应用场景下的解释，使论文从算法实现描述进一步过渡到面向 IoT 部署的完整实验型稿件。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  继续压缩论文中重复表述，补充表格与图示之间的引用检查，并进一步核对实验数据、参考文献和版式细节。
])

#v(1em)

= 第四篇论文整体叙事与章节结构整理

== 引言、背景与贡献链条重写

本周首先集中处理论文前半部分的叙事结构，使文章从“介绍算法”转为“说明部署问题并给出系统评测”。在引言部分，围绕量子计算对 IoT 公钥机制迁移的现实压力，重新组织了 ML-DSA、MQTT 和资源受限设备三者之间的关系，并把论文贡献收束为实现优化、协议集成和系统评估三个层次。背景部分则重点保留与本文部署问题直接相关的两类事实，即 ML-DSA 在标准参数集下的签名长度为 2,420--4,627 字节，以及其在 Cortex-M4 上的主要开销集中于 NTT、多项式模运算和拒绝采样过程。#bluet[这一轮重写的目的不是增加新结论，而是让后续实验结果能够自然对应前文提出的部署问题与评价维度。]

== 论文主体结构从算法描述过渡到实验论文

在完成引言与背景衔接后，本周继续调整全文结构，使章节之间形成较清晰的因果链条。原稿中的实现细节、协议设计和实验结果此前较为分散，本周将其整理为“优化实现与 MQTT 集成”之后再进入“实验评测”，并在段首明确各节承担的任务，例如实现章节解释为什么优化 NTT 与 Montgomery 约简，协议章节解释为什么采用负载内嵌而不是修改 broker，实验章节则对这些设计带来的代价进行量化。经过这一轮调整后，论文主干已基本形成从实现到部署的连续叙述，而不是单纯罗列模块内容。

= 实现设计与 MQTT 集成章节撰写

== Cortex-M4 上的 ML-DSA 优化实现整理

本周对实现章节进行了较完整的文字化整理，目标是将代码层面的优化操作转写为可发表的实验描述。该部分明确说明实验平台使用 STM32F407VG 开发板，主频为 168 MHz，搭配 ESP32-WROOM-32 通过 UART 接入 WiFi 网络；在密码实现层面，则将优化重点归纳为三项：关键算术路径映射到手工调优的 ARM Cortex-M4 指令、围绕 Montgomery 域组织模约简、以及在 NTT 蝶形序列中按取值范围延后归一化步骤。对应地，接口层继续保持 `crypto_sign_keypair()`、`crypto_sign()` 和 `crypto_sign_verify()` 的标准调用边界，以便后续实验分别测量密码开销和通信开销。#redt[这一部分已经从“实现过程记录”整理为“可复现实验设置说明”，为评测章节提供了统一前提。]

== MQTT 负载嵌入式签名方案整理

在协议集成部分，本周重点整理了如何在不修改 broker 行为的前提下，将 ML-DSA 签名嵌入 MQTT 发布订阅流程。当前稿件采用负载内嵌的 type-length-value 结构，将消息类型、有效载荷长度、应用数据、算法标识、密钥标识、时间戳、签名长度和 ML-DSA 签名字节串封装为同一应用层负载，再作为标准 MQTT PUBLISH 数据发送。这样处理后，broker 仍将数据视为透明字节流，不需要扩展协议字段，也不需要增加 broker 端解析逻辑，而订阅端则可据此恢复应用负载并执行新鲜性检查和签名验证。该部分的表述重点已经从“怎么封装”转向“为什么这样封装更适合标准 MQTT 工作流”。

= 实验结果与部署分析写作

== 关键性能指标与实验表格整理

本周在实验章节中集中整理了计算性能、消息开销和端到端性能三组结果，并统一了表格中的口径。当前稿件中，ML-DSA-44、65、87 的签名生成时间分别为 663 ms、853 ms 和 1,136 ms，对应 ECDSA P-256 的 70.6--121.0 倍开销；验证时间分别为 420 ms、533 ms 和 710 ms；总 SRAM 占用范围为 22.7--43.1 KB，Flash 占用范围为 37.2--73.9 KB。在协议层面，50 字节 MQTT 负载在引入签名后扩展为 2,478、3,367 和 4,685 字节，端到端发布-订阅总时延分别为 1,114 ms、1,420 ms 和 1,883 ms。通过将这些指标集中重写，实验部分现在能够直接回答“是否能部署”“瓶颈在哪里”“不同参数集差别有多大”这几个核心问题。

== 部署可行性与优化建议补充

在给出测量结果后，本周继续补写了部署分析部分，使实验章节不仅报告数据，也解释这些数据对实际场景意味着什么。当前稿件分别讨论了高吞吐传感网络、电池供电设备和实时控制系统三类场景：前者受限于 0.87--1.52 条消息每秒的可持续吞吐能力，后者需要考虑单次签名约 32.9 mJ 的能耗，而实时控制场景则会受到 1.11--1.88 s 端到端认证时延的直接限制。在此基础上，又把参数集选择、消息聚合、混合认证和未来硬件加速整理为四类后续优化方向，使结论部分能够从纯结果总结延伸到面向部署决策的解释。
