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
    周报 向嘉豪(2026-03-02)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周#redt[完成硕士学位论文《SPN结构密码的软硬件优化实现研究》全文定稿与查重审查]，论文涵盖CRAFT密码FPGA实现、比特切片SPN密码32位处理器优化及GPU线程自适应AES并行优化三项研究，经检测文本重复率为6%，AIGC重复率为26%。同时#bluet[对第四篇小论文ML-DSA数字签名在资源受限MQTT环境中的实现进行修订]，新增算法复杂度分析章节（Section 2.2），从NTT蝶形运算、采样操作到三阶段协议层面推导渐近复杂度与具体模乘运算次数，为后续优化方向提供理论依据。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  1) 根据查重结果对硕士学位论文进行针对性修改，降低AIGC重复率
  2) 继续修改第四篇小论文，完善实验评估部分
])

#v(1em)

= 硕士学位论文定稿与查重审查

== 论文整体结构与内容

完成了硕士学位论文《SPN结构密码的软硬件优化实现研究》的全文定稿工作。论文共六章，围绕SPN结构分组密码在"云-边-端"三级计算平台上的优化实现展开研究。第一章绪论部分梳理了SPN密码实现优化的研究背景与国内外现状。第二章介绍SPN密码实现的基础理论，包括AES与轻量级密码的代数结构、FPGA硬件架构基础、比特切片技术原理及GPU并行计算模型。第三章至第五章分别对应三项核心研究贡献：第三章提出CRAFT密码的FPGA串行与展开架构实现，利用SAT求解器结合GEC编码优化S-box逻辑表达式，在Xilinx Artix-7上实现面积缩减10.16%与吞吐量提升40.53%（569.52 Mbps）；第四章提出面向32位嵌入式处理器的比特切片SPN密码优化方法，包含OPO置换优化算法与改进的BGC模型编码，在ARM Cortex-M4上实现QARMAv2首次比特切片软件实现（684.50 CPB）；第五章提出GPU线程自适应AES并行优化方法，在NVIDIA RTX 4090上AES-128-CTR模式达到1842 Gb/s吞吐量。第六章总结全文并展望未来研究方向。

== 查重检测结果

论文定稿后进行了查重与AIGC检测审查。#redt[文本重复率为6%]，符合学位论文查重要求。#bluet[AIGC重复率为26%]，后续需对AIGC检测标记的段落进行针对性改写，调整表达方式与句式结构以降低该指标。

= 第四篇小论文修订——ML-DSA算法复杂度分析

== 新增算法复杂度分析章节

本周对第四篇小论文《ML-DSA Digital Signatures in Resource-Constrained MQTT Environments》进行修订，主要工作为新增Section 2.2算法复杂度分析章节。该章节从理论层面对ML-DSA各组件的计算复杂度进行推导，为论文中ARM Cortex-M4上的实测性能数据提供理论支撑。

NTT分析部分基于FIPS 204规范中Algorithm 41（正向NTT）与Algorithm 42（逆向NTT），推导出每次NTT变换包含8层蝶形运算，产生1024次模乘与2048次模加，时间复杂度为$O(n log n)$（$n = 256$）。逐点NTT乘法（Algorithm 45）产生256次模乘，复杂度为$O(n)$，每次模乘采用Barrett约减（预计算参数$k = 48$）实现常数时间执行。采样操作部分分析了ExpandA（Algorithm 32）通过SHAKE-128拒绝采样生成公共矩阵$hat(bold(A)) in T_q^(k times l)$的开销（接受概率约0.9986），以及ExpandS（Algorithm 33）生成有界系数秘密向量的采样效率（$eta = 2$时接受概率$5\/8$，$eta = 4$时接受概率$9\/16$）。

== 协议层面复杂度与具体运算量统计

在协议层面，新增章节对ML-DSA三阶段操作进行复杂度归纳：密钥生成（Algorithm 6）以矩阵-向量乘积为主导，复杂度$O(k l n)$；签名（Algorithm 7）受拒绝采样循环影响，总复杂度$O(macron(kappa) k l n)$，其中期望迭代次数$macron(kappa)$在ML-DSA-44/65/87三个参数集上分别为4.25、5.1和3.85次；验证（Algorithm 8）为确定性执行，复杂度$O(k l n)$。#bluet[新增的具体模乘运算量统计表给出了三个参数集各操作的精确运算次数]，例如ML-DSA-44签名单次迭代需16384次模乘、期望总计69632次，ML-DSA-87签名单次迭代需36864次模乘、期望总计141926次。该分析揭示矩阵-向量乘积$hat(bold(A)) hat(bold(v))$为所有操作的性能瓶颈，其模乘次数随参数集$(k, l)$从$(4, 4)$增长到$(8, 7)$时由4096增至14336，呈$O(k l)$增长趋势，为后续NTT硬件加速与参数集选择优化提供了量化依据。
