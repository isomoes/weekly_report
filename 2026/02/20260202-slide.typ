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

#redt[完成硕士学位论文第四章面向32位处理器的SPN密码比特切片低延迟实现撰写]

#bluet[对第四篇小论文进行结构调整，删除自适应协议内容，补充MQTT后量子迁移文献]

== 第四章比特切片SPN密码理论基础

#redt[针对32位处理器架构限制，提出置换优化算法（OPO）和改进的BGC模型编码方法]

- 比特切片技术：将密码组件映射到位级操作，建立线性层和非线性层形式化表示
- 64位分组分割为16个4位小空间，每个小空间由四个寄存器表示
- 在ARM Cortex-M和Xtensa LX处理器上实现高效实现

== 线性层与非线性层优化

#bluet[基于置换分解的线性层优化引入置换原语操作（PPO）形式框架]

- 线性层：通过掩码合并与移位分解，QARMAv2置换从14个PPO减少到5个，指令减少64.3%
- 非线性层：基于BGC模型的S盒优化采用ANF简化约束函数
- 求解时间较现有方法减少11.7%--86.1%，平均加速3.19倍

== 第四篇小论文修订

#redt[删除自适应安全级别选择协议相关全部内容]

- 论文贡献从三项调整为两项：性能基准测试与MQTT集成评估
- 删除内容：设计原理、消息关键性分类、资源状态评估、实验评估等

#bluet[补充MQTT后量子迁移相关文献综述]

- 新增Dilithium后量子认证延迟分析、MQTT混合后量子开销量化等文献

= 总结

== 下周计划

- 修改第四篇小论文
- 完成硕士学位论文第五章的撰写工作

== 老师评语

*我上周跟你说的页数过少，你在本次工作报告没提？也没进行相应增加，有什么想法？*

第四篇小论文经重新审视后，发现自适应安全级别选择协议的创新性不足——其本质为基于阈值的参数配置策略，#bluet[缺乏形式化模型与新颖性，难以支撑发表]。因此删除该部分内容，并通过补充MQTT后量子迁移文献综述来充实论文。页数将在后续修订中随新内容补充而增加。
