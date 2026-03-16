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
    周报 向嘉豪(2026-03-16)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周工作主要围绕学位论文 `thesis.tex` 对应稿件的 Word 版本整理展开，按主文档中的中英文摘要、目录、6章正文以及“攻读学位期间取得的研究成果”“致谢”等部分逐段整理，对转换后的表格、数学符号、算法环境和相关版式错误进行修正，并结合答辩意见继续核对文本和格式中的问题。与此同时，对 FourthPaper 进行 IEEE 风格文字精简，修改集中在摘要、引言和背景 3 个部分。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  继续检查学位论文版本中的表格、公式与算法排版和格式问题。
])

#v(1em)

= 学位论文 Word 转换与答辩稿核对修订

== TeX转Word版本与排版问题处理

本周主要处理学位论文转为 Word 版本后的排版问题。根据 `thesis.tex` 的主文档结构，Word 稿需要重新整理中英文摘要、目录、6章正文以及 2 个后置章节的层级和版式；其中，受 LaTeX 环境影响最明显的表格、公式和算法内容，需要在 Word 中分别调整表格位置与版心关系、数学符号显示形式以及算法标题和步骤版式。#redt[本周修订重点集中在转换后对表格、数学符号、算法环境及整体版式的修复。] 具体处理围绕目录层级、章节标题编号、公式符号显示和算法版式这几类位置展开。

== 基于答辩核对与修订

在完成基础排版处理后，本周继续将转换后的论文稿与答辩进行对照，重点检查正文表述、符号呈现和页面格式的一致性，并修正仍然存在的差异。核对范围覆盖中英文摘要、目录、各章正文以及“攻读学位期间取得的研究成果”“致谢”等后置部分，处理目标是将 Word 稿中的标题层级、文本内容和符号呈现继续向答辩通过版本对齐。

= FourthPaper IEEE风格压缩修订

本周同时对 FourthPaper   进行文字精简，修改集中在摘要、引言和背景 3 个部分，主要处理长句压缩、重复限定语删除以及部分动词和连接表达的替换，并以  记录对应修改。#bluet[本轮修改主要体现为  在摘要、引言和背景部分的句式压缩与措辞替换。]
