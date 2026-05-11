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
    周报 向嘉豪(2026-05-11)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作围绕大论文《SPN 结构密码的软硬件优化实现研究》外审意见修改与预答辩材料整理展开。修改集中在#redt[绪论研究现状深化、第六章跨平台讨论补充、AES 实现列表压缩与参考文献规范化]，并完成评审意见逐条回复文档与预答辩 PPT 评审回复章节的撰写，同步启动老师 docx 批注与预答辩评审意见表的下一轮修订。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  按预答辩评审意见表与老师 docx 批注继续修订大论文，重点处理绪论衔接桥段、docx 公式整体加粗渲染、参考文献期刊缩写展开与 2025--2026 新增文献，同时完成封面导师职称、致谢、期刊分区与预警/OA 期刊清理。预答辩 PPT 将同步根据修订后正文调整成果引用与跨平台讨论页。
])

#v(1em)

= 绪论与研究现状深化

== 国内外研究现状重写

针对外审专家提出的"国内外研究现状分析不够深入"意见，在绪论"国内外研究现状"一节按 FPGA 轻量级密码实现、32 位嵌入式处理器位切片优化和 GPU 并行密码实现三个方向重写综述段落，新增约 800 字分析并补充对应文献。FPGA 部分梳理 PRESENT、GIFT、CRAFT 等典型算法在面积-吞吐率-能耗维度的权衡研究并指出与本文工作的边界；嵌入式处理器部分增补位切片技术在 ARM 与 RISC-V 平台上的线性层与非线性层协同优化代表性成果；GPU 部分补充线程配置、流水线调度与资源利用率方面的研究背景。同步完成对 CRAFT 相关"首次"等绝对化表述的弱化，并修正英文标题中冗余的 "Research on"。

= 第六章跨平台讨论与展望

== 跨平台实用性与侧信道展望

外审意见指出原稿缺少跨平台实用性讨论与侧信道展望，本周在第六章"总结与展望"中新增两段：一段说明 FPGA、嵌入式处理器与 GPU 三套优化方案在体系结构特化与跨平台迁移之间的取舍，另一段将侧信道安全性纳入未来工作展望，覆盖功耗、电磁与时间侧信道在三类平台上的可行检测路径。

= AES 实现与参考文献规范

== ShiftRows listing 压缩与中文期刊补充

外审意见指出 AES ShiftRows 相关 listing 行数过长不利于审阅，已将该部分代码压缩并调整排版。同时新增 6 篇高水平中文期刊参考文献并在正文相应位置完成引用。#bluet[本周还修正了 docx 与 PDF 版本号不一致、部分引用未在正文出现等问题，使评审版本与提交版本严格对齐。]

= 评审意见逐条回复文档

== 回复文档撰写

新建评审回复文档，按"感谢意见、修改位置、修改内容、修改原文蓝色标注"的统一结构组织两位评审专家的全部条目，作为正式答辩材料附件与正文修订同步发布。

= 预答辩 PPT 评审回复与引用样式

== 评审回复章节与封面信息

预答辩 PPT 新增 review-response 章节，按外审专家意见编号逐页对应修改位置与修改内容，并在 PPT 封面与页眉补充学校 logo。成果页扩展为完整引用形式，使发表论文、专利与软著的来源信息与正文参考文献保持一致。

== 引用样式修复

针对老师反馈的引用格式问题，对 PPT 与正文中作者-年份混排、缺失年份和编号样式不统一的引用进行了两轮修正，使引用样式在 PDF 渲染下保持一致。#redt[当前正文与 PPT 已作为外审与预答辩阶段稳定基线，后续修订基于此版本继续推进。]

= 下一轮修订周期启动

== 老师批注与预答辩评审意见表

本周末已启动新一轮修订，导入老师在 docx 中标记的 9 处批注以及预答辩评审意见表中提出的 10 项条目，按统一的 review tag 编号体系整理至待办清单。已完成的条目包括封面导师职称与致谢补充、中科院 X 区分区标签展开、Springer 会议规范化、参考文献会议地点与出版社补齐、作者与期刊名缩写规范化、预警/OA 期刊标记、2025--2026 文献补充、公式加粗渲染修复以及绪论衔接桥段重写。剩余导师签字与拟投稿成果删除两项需在确认稿件外协流程后处理。
