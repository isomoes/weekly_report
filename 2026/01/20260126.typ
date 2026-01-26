
#import "@preview/basic-document-props:0.1.0": simple-page

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
    周报 向嘉豪(2026-01-26)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周#redt[完成第四篇小论文的精简工作]，将论文篇幅从15页压缩至7页，删除514行冗余内容并新增174行精炼表述。同时#bluet[完成硕士学位论文第三章面向资源受限环境的CRAFT密码FPGA高效实现的撰写工作]。第三章系统阐述了CRAFT算法的结构与规范，提出串行与展开两种FPGA优化实现架构，利用SAT求解器优化S盒实现使面积减少28.9%，并在Artix-7、Kintex-7、Spartan-7三种FPGA平台上进行了全面的性能评估。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  1) 修改第四篇小论文
  2) 继续完成第四章面向32位处理器的SPN密码比特切片低延迟实现的撰写工作
])

#v(1em)

= 第四篇小论文精简

完成了第四篇小论文的篇幅精简工作，将论文从原有的15页压缩至7页，以满足期刊投稿要求。本次修改删除了514行冗余内容，新增174行精炼表述，整体精简幅度约为50%。#redt[精简工作遵循AGENTS.md中定义的写作规范]，在保留核心贡献和关键实验结果的前提下，对以下部分进行了重点压缩：Related Work部分删除了过多的历史背景介绍，聚焦于本研究填补的具体空白；算法描述部分简化了优化技术的实现细节，保留核心算法结构的完整性；实验方法部分合并了重复的测量方法说明，减少了统计方法的冗余描述。

精简后的论文结构更加紧凑，核心贡献的表述更为清晰。#bluet[通过删除冗余的部署配置示例和过度详细的性能分析]，使论文能够在有限篇幅内完整呈现研究的创新点和实验验证结果，提升了论文的可读性和投稿竞争力。

= 硕士学位论文撰写

== 第三章CRAFT密码FPGA高效实现

完成了第三章面向资源受限环境的CRAFT密码FPGA高效实现的撰写工作，该章节包括CRAFT算法结构与规范、FPGA优化实现方法和实现结果与资源评估三个主要部分。#redt[本章首次在FPGA平台上实现了CRAFT轻量级密码]，提出串行与展开两种架构分别优化面积与吞吐率。

CRAFT算法结构与规范部分详细描述了CRAFT作为轻量级可调块密码的基本特性，包括64位明文、128位密钥和64位杂凑的输入输出规范。轮函数由列混合、字节置换和S盒三部分组成，其中列混合采用自反矩阵实现加解密复用，S盒为4位输入输出的非线性变换。

FPGA优化实现方法部分提出了两种架构设计。#bluet[串行架构将数据通路宽度从64位降为4位]，通过复用硬件资源降低面积，S盒数量由16降为1，并采用时钟门控技术降低能耗。基于SAT求解器的S盒优化采用GEC编码方案，最终方案采用4个MOAI1门、3个MAOI1门和1个AND3门，面积较现有方案减少28.9%。展开架构每周期执行2轮函数，可在16个周期内完成加密，相比迭代架构的32周期实现吞吐率翻倍。

实现结果与资源评估部分在Artix-7、Kintex-7、Spartan-7三种FPGA平台上进行了全面测试。实验结果表明，串行架构面积较迭代架构减少10.16%，展开架构最大吞吐率提升40.53%，单比特能耗降低47.89%。性能评估指标包括FF、LUT、Slice等面积指标，以及最大吞吐率、100MHz下吞吐率、单位Slice吞吐率等吞吐率指标，同时对动态功耗、静态功耗和能耗进行了详细分析。

