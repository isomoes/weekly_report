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
    周报 向嘉豪(2026-03-09)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周围绕硕士学位论文与第四篇小论文开展了两项写作性修改工作。其一，#redt[对硕士学位论文《SPN结构密码的软硬件优化实现研究》进行结构性润色与规范化整理]，补入封面PDF页，替换参考文献中多条预印本条目为正式出版信息，并集中修订第三章至第五章的段落组织、术语表述与图文排版。其二，#bluet[对第四篇小论文《ML-DSA Digital Signatures in Resource-Constrained MQTT Environments》进行重组]，重写摘要与引言的研究链条，将工作表述调整为“实现优化—MQTT集成—系统评估”的递进结构，同时压缩背景章节中的复杂度分析，保留NTT、采样和参数集运算量等支撑实验解读的核心内容。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  继续完善第四篇小论文中的实验数据、摘要与结论表述，使全文与实验章节保持一致。
])

#v(1em)

= 硕士学位论文修改与规范化整理

== 前置材料与参考文献更新

本周首先对硕士学位论文主文件进行了整理，在文档前置部分补入#bluet[封面PDF页的整页引入配置]，使论文编译后的前置材料与正式送审版本保持一致。在参考文献部分，对文献数据库中的多条条目进行了核对与替换，将部分预印本或信息不完整的记录更新为正式发表版本，补全页码、卷号、期号和DOI等出版信息，并将部分会议或期刊来源调整为最终出版形态。该项修改主要服务于论文定稿阶段的格式规范化要求，减少文献信息不一致对后续审查与归档造成的影响。

== 第三章至第五章表述修订

在正文部分，本周集中修订了第三章至第五章与摘要相关内容，重点处理术语统一、段落衔接和技术表述精炼等问题。以第三章为例，对CRAFT算法描述中的“杂凑”统一修正为“调整值（Tweak）”，并将串行架构、展开架构、列混合时序、有限状态机控制流程等内容由原先偏列表式说明调整为更连贯的学术叙述；同时，对图表布局进行了局部整理，使双图排版与标题位置更稳定。第四章与第五章则围绕比特切片表示、置换操作优化、BGC模型编码、AES与QARMAv2实现说明等段落进行了语言压缩与逻辑重排，保持术语、符号和性能分析口径一致。#redt[本轮修改的核心目标是将定稿内容从“结果罗列”进一步收束为“问题—方法—实验—结论”的章节表达结构]，为后续送审版细修提供较稳定文本基础。

= 第四篇小论文重组与背景章节重写

== 摘要与引言框架调整

本周对第四篇小论文进行了较大幅度的结构重组，首先重写了摘要与引言的研究 framing。摘要不再仅以性能测试为主线，而是改写为围绕ARM Cortex-M4平台上的ML-DSA部署，从实现优化、面向MQTT的签名集成以及系统级评估三个层面展开描述；引言部分则补充了IoT长期运行约束、MQTT对报文扩展敏感、后量子签名与证书体系兼容等背景动机，并重新组织现有工作的评述方式。相应地，论文贡献由原来的“性能基准测试、MQTT集成评估”两点，调整为#bluet[实现级优化、协议级集成、系统级评估]三项，使论文主线与后续章节安排保持一致。

== 背景章节与复杂度分析重组

在背景章节中，本周将原有“Background and Related Work”重构为单一的“Background”部分，并将ML-DSA算法说明与复杂度分析合并书写。修改后的版本保留了最能支撑实验解读的计算内容，包括$n = 256$条件下NTT与逆NTT各含1024次模乘和2048次模加、采样阶段的$O(k l n)$与$O((k+l)n)$级别开销，以及不同参数集下矩阵-向量乘法、密钥生成、签名和验证的代表性模乘统计。与此同时，删除了部分展开过细的算法逐步推导和大段相关工作综述，使背景章节更加紧凑，并突出#redt[签名阶段因拒绝采样循环而呈现$O(macron(kappa) k l n)$主导复杂度]这一后续实验分析所依赖的关键结论。经过本轮调整，小论文的章节边界与叙述重心已基本稳定，后续可在此基础上继续补全实验结果与部署讨论。
