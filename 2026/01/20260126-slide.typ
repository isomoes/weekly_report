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

// Set Chinese fonts for the presentation
#set text(font: (
  "Source Han Serif", // Alternative Chinese serif font
))

// Color shorthand functions
#let redt(content) = text(fill: red, content)
#let bluet(content) = text(fill: blue, content)
#let greent(content) = text(fill: green, content)
#let yellowt(content) = text(fill: yellow, content)
#let oranget(content) = text(fill: orange, content)
#let purplet(content) = text(fill: purple, content)
#let greyt(content) = text(fill: gray, content)
#let grayt(content) = text(fill: gray, content)

// Additional font customization options:
#show heading: set text(font: "Source Han Sans", weight: "bold")
#show raw: set text(font: "Source Han Mono SC")

#show heading: set text(font: "Source Han Sans")
#show: simple-theme.with(aspect-ratio: "16-9", footer: [周报])

#title-slide[
  = 周报
  #v(2em)

  #v(2em)
  2026-01-26
]

=

== 本周研究摘要

#redt[完成第四篇小论文精简工作，篇幅从15页压缩至7页]

#bluet[完成硕士学位论文第三章CRAFT密码FPGA高效实现撰写]

== 第四篇小论文精简

#bluet[删除514行冗余内容，新增174行精炼表述，精简幅度约50%]

- Related Work：删除过多历史背景介绍，聚焦研究空白
- 算法描述：简化优化技术实现细节，保留核心算法结构
- 实验方法：合并重复测量方法说明，减少统计方法冗余描述

#redt[精简后核心贡献表述更清晰，提升论文可读性与投稿竞争力]

== 第三章CRAFT密码FPGA高效实现

#redt[首次在FPGA平台上实现CRAFT轻量级密码]

- CRAFT算法：64位明文、128位密钥、64位杂凑，轮函数含列混合、字节置换、S盒
- 串行架构：数据通路宽度从64位降为4位，S盒数量由16降为1
- 展开架构：每周期执行2轮函数，16周期完成加密

#bluet[基于SAT求解器优化S盒，采用4个MOAI1门、3个MAOI1门、1个AND3门]

== 实现结果与资源评估

#bluet[在Artix-7、Kintex-7、Spartan-7三种FPGA平台进行测试]

- 串行架构面积较迭代架构减少10.16%
- 展开架构最大吞吐率提升40.53%
- 单比特能耗降低47.89%

#redt[S盒优化方案面积较现有方案减少28.9%]

= 总结

== 下周计划

- 修改第四篇小论文
- 继续撰写第四章：面向32位处理器的SPN密码比特切片低延迟实现

== 老师评语

*15页到7页又少了，一般9到12页左右，不低于9页*

后续补充提升核心创新点


