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
  #datetime.today().display()
]

=

== 本周研究摘要

#redt[完成硕士学位论文《SPN结构密码的软硬件优化实现研究》全文定稿与查重审查]

#bluet[对第四篇小论文ML-DSA数字签名进行修订，新增算法复杂度分析章节]

== 硕士学位论文定稿

#redt[论文共六章，涵盖CRAFT密码FPGA实现、比特切片SPN密码优化及GPU并行AES优化三项研究]

- 第三章：CRAFT密码FPGA实现，面积缩减10.16%，吞吐量提升至569.52 Mbps
- 第四章：32位处理器比特切片优化，QARMAv2首次比特切片实现（684.50 CPB）
- 第五章：GPU线程自适应AES优化，RTX 4090上达到1842 Gb/s吞吐量

== 查重检测结果

#redt[文本重复率6%]，符合学位论文查重要求

#bluet[AIGC重复率26%]，需对标记段落进行针对性改写以降低该指标

== ML-DSA算法复杂度分析

#redt[新增Section 2.2算法复杂度分析章节，为实测性能数据提供理论支撑]

- NTT变换：8层蝶形运算，每次1024次模乘与2048次模加，复杂度$O(n log n)$
- 采样操作：ExpandA拒绝采样接受概率约0.9986，ExpandS接受概率$eta = 2$时$5\/8$
- 密钥生成与验证复杂度$O(k l n)$，签名复杂度$O(macron(kappa) k l n)$

== 协议层面运算量统计

#bluet[新增具体模乘运算量统计表，揭示矩阵-向量乘积为性能瓶颈]

- ML-DSA-44签名：单次迭代16384次模乘，期望总计69632次
- ML-DSA-87签名：单次迭代36864次模乘，期望总计141926次
- 模乘次数随$(k,l)$从$(4,4)$增至$(8,7)$时由4096增至14336，呈$O(k l)$增长

= 总结

== 下周计划

- 根据查重结果对硕士学位论文进行针对性修改，降低AIGC重复率
- 继续修改第四篇小论文

== 老师评语

*重在推进第4篇论文进展*

继续推进
