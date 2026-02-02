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
    周报 向嘉豪(2026-02-02)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周#redt[完成硕士学位论文第四章面向32位处理器的SPN密码比特切片低延迟实现的撰写工作]，系统阐述了比特切片SPN密码的理论基础、线性层与非线性层优化方法，以及AES和QARMAv2密码的优化实现与性能评估。同时#bluet[对第四篇小论文进行结构调整]，删除了自适应安全级别选择协议相关内容，补充了MQTT后量子迁移的相关文献综述，使论文聚焦于ML-DSA性能基准测试与MQTT集成评估。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  1) 修改第四篇小论文
  2) 完成硕士学位论文第五章的撰写工作
])

#v(1em)

= 硕士学位论文撰写

== 第四章面向32位处理器的SPN密码比特切片低延迟实现

完成了第四章面向32位处理器的SPN密码比特切片低延迟实现的撰写工作，该章节共532行，包括比特切片SPN密码的理论基础、线性层与非线性层优化方法、AES与QARMAv2密码的优化实现三个主要部分。#redt[本章针对32位处理器架构的限制，提出了置换优化算法（OPO）和改进的比特切片门复杂度（BGC）模型编码方法]，在ARM Cortex-M和Xtensa LX处理器上实现了密码的高效实现。

比特切片SPN密码的理论基础部分详细描述了比特切片技术的核心原理，包括将密码组件映射到二进制域中的位级操作。该部分建立了线性层和非线性层的形式化表示方法，定义了线性变换矩阵和S盒变换的代数标准形式（ANF）。以QARMAv2密码为例，说明了64位分组如何被分割为16个4位小空间，每个小空间由四个寄存器表示。

线性层与非线性层优化方法部分提出了两种核心优化技术。#bluet[基于置换分解的线性层优化引入了置换原语操作（PPO）的形式框架]，通过掩码合并性质和移位分解性质将QARMAv2的置换操作从14个PPO减少到5个，实现64.3%的指令减少。基于BGC模型的S盒优化采用代数标准形式简化约束函数，相比现有方法实现11.7%--86.1%的求解时间减少，平均加速3.19倍。


= 第四篇小论文修订

完成了第四篇小论文的结构调整与内容修订工作。#redt[删除了自适应安全级别选择协议（Adaptive Security Level Selection Protocol）相关的全部内容]，包括设计原理、消息关键性分类、资源状态评估、安全性分析等小节，以及相关的实验评估部分（工作负载配置、开销减少、能耗节省、安全级别分布、协议开销评估）。论文贡献从三项调整为两项：性能基准测试（Performance Benchmarking）和MQTT集成评估（MQTT Integration Assessment）。

#bluet[补充了MQTT后量子迁移的相关文献综述]，新增了Samandari和Gritti关于MQTT中Dilithium后量子认证的延迟与负载扩展分析，Rampazzo和Henriques关于MQTT混合后量子开销的量化研究，以及Cho等人关于大规模流量检测中量子就绪性滞后的观察。同时引用了Kampanakis和Sikeridis关于TLS和SSH中握手延迟与证书大小开销的性能研究，这些文献为IoT约束环境下的协议级开销提供了更全面的背景支撑。

