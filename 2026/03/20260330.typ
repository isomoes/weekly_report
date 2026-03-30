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
    周报 向嘉豪(2026-03-30)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作主要围绕盲审版学位论文的修订展开。对盲审版 Word 稿的封面信息、目录编号、章节页码、正文段落位置和术语表述进行了连续修订，并根据冯师姐反馈继续处理格式与内容问题。#redt[本周工作的核心是将盲审版论文从“可提交稿”继续整理为“可检查稿”，重点完成格式修补、批注意见吸收和学校信息脱敏。]

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  规划博士研究课题
])

#v(1em)

= 盲审版学位论文 Word 稿格式修订

== 封面、目录与章节版式连续校正

本周首先围绕盲审版论文的整体格式开展修订。主要处理内容集中在封面字段排布、目录编号与标题间距、章节页码对应关系以及局部空白位置调整。具体来看，封面页中的学位类别、学院信息、学号和分类号等字段在 Word 中重新整理了换行与对齐关系；目录部分对 `1.1.1`、`2.1`、`4.3.1` 等多级标题编号后的多余空格进行了清理，并同步修正第四章、第五章对应页码；正文中还对个别图表和表格附近的留白进行了补齐。#bluet[本轮格式修订覆盖了前置页、目录以及正文章节的编号和页码映射关系。]

== 正文内容位置与术语表达调整

在基础版式处理之外，本周继续修正正文中的局部内容位置和术语表达。部分段落在章节内重新放置，例如关于 CRAFT 面积评估的说明被移回与表 3-6、图 3-8 更匹配的位置，以减少图表说明与正文分析之间的割裂；同时，对“本工作”等表述进行了统一替换，使章节内部叙述更符合论文书写语境。针对理论意义部分的条目衔接，也去除了不必要的枚举痕迹，改写为连续段落，从而使 Word 稿在保留原始技术内容的同时更接近最终提交格式。

= 冯师姐反馈与盲审信息脱敏处理

== 根据反馈继续处理问题位置

本周后半段结合冯师姐提交的问题，对盲审版论文进行了进一步修订。相关修改不仅涉及格式，也涉及文本一致性检查：一方面，继续核对封面与声明页中的字段信息，删除盲审稿中不应保留的学院名称；另一方面，对正文中若干术语、段落连接和图表前后说明进行了复查，避免出现同一概念在不同页面中的称呼不一致或说明位置错位。#redt[这一轮修订的重点是依据外部反馈逐项清理可见问题，而不是新增论文内容。]

== 盲审版本学校信息脱敏

在完成格式和内容问题修订后，本周还对盲审版中的学校相关信息进行了脱敏处理。原创性声明和学位论文授权使用声明中的学校名称被替换为星号占位，以满足盲审稿匿名化要求；此前保留在封面和前置页中的学院信息也已同步移除。该部分修改虽然篇幅不大，但直接关系到盲审版的提交规范，因此被单独检查，并与前一轮格式修订结果合并。
