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
    周报 向嘉豪(2026-04-27)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作主要围绕第四篇论文 `ML-DSA Digital Signatures in Resource-Constrained MQTT Environments` 的正文定稿展开，重点修订摘要、引言、贡献表述、实现设计说明、MQTT 集成叙事和部署对比讨论。修改过程中将论文创新点收束为#redt[“标准保持的 Cortex-M4 端点优化、兼容现有 broker 的 MQTT 签名承载、以及端到端部署边界评测”]。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  继续检查稿件中的部署对比表、结构图引用、实验数据解释和结论边界，重点压缩重复表述，并使“本文适用场景”和“其他迁移路径适用场景”的区分更加明确。
])

#v(1em)

= 第四篇论文创新定位修订

== 问题定义与贡献表述重写

本周首先重写了摘要、引言与贡献列表，使文章不再停留在“实现 ML-DSA 并接入 MQTT”的一般描述，而是直接提出 MQTT 场景中的部署问题：标准化 ML-DSA 能否在资源受限端点上完成签名，并且其 2,420--4,627 字节签名是否能够在轻量级发布订阅流程中被承载。贡献表述被改为三个差异化问题的回答：高签名开销来自哪些端点算术路径，签名如何在不修改 broker 的情况下进入 MQTT 流程，以及联合密码计算与协议传输后会形成怎样的部署边界。#redt[这一版写作避免把常规参数选择或封装策略夸大为新协议，而是把创新定位为标准保持、broker 兼容和证据驱动的部署评估。]

= 方法叙事与图示支撑整理

== 标准保持的端点优化逻辑

在实现章节中，本周重点补充了为什么优化必须放在端点算术路径上。稿件明确说明 MQTT 层无法消除签名主循环中的计算瓶颈，非标准参数也会削弱与 FIPS 204 部署目标的直接对应关系，因此实现优化集中在固定 NTT 调度、基于倒数乘法的模约简、以及 NTT 域密钥状态缓存。图示将预计算状态和在线签名路径分开，说明拒绝采样失败时只需重新处理新鲜掩码向量和挑战多项式，而不应重复变换长期密钥相关状态。

#figure(
  image("figures/mldsa-implementation-optimization.pdf", width: 88%),
  caption: [ML-DSA 端点优化结构图]
)

== Broker 兼容的 MQTT 签名承载逻辑

在 MQTT 集成章节中，本周进一步明确本文选择负载封装而不是协议字段扩展的原因。协议改造型工作可以更显式地暴露安全元数据，但需要修改 broker、客户端或网关；本文的目标则是评估一种保守迁移路径，即发布端生成签名帧，broker 仅执行不感知密码语义的透明转发，订阅端完成帧解析、新鲜性检查、密钥选择和 ML-DSA 验证。#bluet[这一写法突出本文与 MQTT-SN、CoAP 或 broker-aware 改造方案的边界差异：本文牺牲消息尺寸，换取现有 MQTT 基础设施的兼容性。]

#figure(
  image("figures/mqtt-mldsa-architecture.pdf", width: 95%),
  caption: [MQTT-ML-DSA broker 兼容签名承载结构图]
)

= 部署边界与相关工作差异化讨论

本周还整理了与其他后量子迁移路径的对比，使实验结果不只是数值罗列，而是服务于部署边界判断。嵌入式 ML-DSA 基准测试能够解释算术瓶颈，但通常不覆盖 MQTT packet expansion、broker-mediated delivery 和端到端时延；协议适配方案能够更细粒度地处理安全字段，但依赖通信栈修改；KEM 型 MQTT 方案更适合会话密钥建立和对称认证，但不提供与数字签名相同的逐消息公开可验证性和不可抵赖性；硬件加速或向量化实现可以降低算术开销，但不能消除签名尺寸开销。基于签名生成 663--1,136 ms、端到端 1.11--1.88 s 时延和 0.87--1.52 条消息每秒吞吐率，论文结论被收束为条件性判断：ML-DSA 适合低频遥测、资产追踪和需要公开可验证性的审计场景；高吞吐传感网络、实时控制系统和高频电池供电节点则需要聚合、混合认证或硬件辅助。#redt[本文的差异不在于声称单一方案优于所有相关工作，而在于给出现有 MQTT broker 不变时标准 ML-DSA 能否落地的测量依据。]
