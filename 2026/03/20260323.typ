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
    周报 向嘉豪(2026-03-23)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作继续围绕硕士学位论文的大论文整理展开，重点推进#redt[Word 版本的整体版式落地与细节修订]。处理内容主要包括章节层级、标题样式、表格位置以及局部排版顺序等问题。同时，冯师姐对论文 Word 版本提出了较多批注意见，据此逐项修改问题区域，调整内容主要集中在表格位置和若干细节性格式问题。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  继续检查学位论文 Word 版本中的章节格式、表格和公式版式。
])

#v(1em)

= 硕士学位论文 Word 版本版式整理

== 整体布局与章节结构对齐

本周的主要工作是继续完善硕士学位论文 Word 版本的整体布局。处理范围覆盖中英文摘要、目录、正文各章以及后置部分，目标是使 Word 稿在章节层级、标题编号、段落间距和页面结构上与原始版本保持一致。针对转换过程中出现的样式偏移，本周逐项核对标题格式、正文缩进、分页位置和目录映射关系，并重新整理部分段落的先后顺序。#redt[本轮工作的重点已由“完成转换”转为“稳定版式并消除局部错位”]，因此修订重心集中在可见版式问题和文档一致性检查上。

== 关键词、表格与局部排版修订

在完成整体结构对齐后，本周继续处理 Word 稿中的细节问题，主要涉及表格位置以及局部排版排列。关键词部分主要检查摘要页面的对应关系；表格部分则根据页面宽度、段落上下文和标题位置，对若干表格重新调整插入位置与前后留白，减少跨页错位和阅读跳转。对于部分数组式或并列式内容，在 Word 中重新梳理其排列顺序，使公式、表格与正文说明之间的对应关系更加清晰。#bluet[本周细修内容以关键词、表格位置和局部版式顺序调整为主]。

= 冯师姐批注意见整理与问题修订

== Word 版本批注意见整理

本周根据冯师姐对论文 Word 版本给出的批注意见，继续对文档中的问题位置进行整理与归类。批注内容主要涉及文本可读性、技术表述一致性以及版式细节，具体包括术语是否统一、关键词是否准确、表格位置是否合适，以及局部排版顺序是否影响阅读。

== 根据批注意见进行细节修订

在整理完批注内容后，本周继续对对应问题区域进行细节修改。修改重点包括若干关键词的替换与统一、表格位置与相邻段落关系的调整，以及局部排版顺序的重新整理，以减少说明文字与对应对象之间的脱节。对于属于格式层面的修改，主要通过调整标题样式和表格前后布局进行处理；对于属于表述层面的修改，则以保持术语一致和语义准确为目标。
