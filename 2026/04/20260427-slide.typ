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
  2026-04-27
]

=

== 第四篇论文

#bluet[创新定位收束为 Cortex-M4 端点优化、broker 兼容的 MQTT 签名承载和端到端部署边界评测。]

== 主要修改内容

重写摘要、引言、贡献列表和方法叙事，将问题从“实现 ML-DSA 并接入 MQTT”调整为两个部署约束：资源受限端点能否完成标准化 ML-DSA 签名，以及 2,420--4,627 字节签名能否被轻量级发布订阅流程承载。实现章节将优化限定在端点算术路径，保留固定 NTT 调度、基于倒数乘法的模约简、NTT 域密钥状态缓存和负载内嵌签名帧四项具体内容。

== 部署边界收束


将嵌入式 ML-DSA 基准、协议适配方案、KEM 型 MQTT 方案、硬件加速和向量化实现放入同一比较框架，稿件将适用场景限定在低频遥测、资产追踪和审计任务；高吞吐传感网络、实时控制系统和高频电池供电节点仍需要消息聚合、混合认证或硬件辅助。

= 总结

== 下周计划

#redt[下周主要工作转向大论文评审意见修改。]

- 两位评审均指出绪论中研究现状分析需要进一步深化，因此优先扩充 FPGA、32 位嵌入式处理器和 GPU 三类平台的国内外研究综述，并增加归纳总结。
- 后续按“感谢意见、说明修改位置、概括修改内容”的方式逐条回复，同时处理英文题名、跨平台实用性与兼容性、侧信道安全展望、表 4-5 和表 4-6 形式、高水平中文期刊文献，以及“首次”等绝对化表述。

== 老师评语

*如果延续这种写工作报告风格并引以为豪，你未来会吃大亏，人要善于听进去，我还可以告诉你：
你们考上博士的我完全可以不管，不需要你们再交工作报告了，我轻松很多，关系也更融洽，但如果是这样的方式去读博士和将来进入工作单位，不会有别的导师和领导这样教你了。
最关键的是我看到论文是没有进展的！*

收到，后续工作报告将减少泛泛表述，直接说明论文修改位置、具体改动和结果。下周优先根据评审意见修改大论文，并同步整理逐条回复说明。
