#import "@preview/basic-document-props:0.1.0": simple-page
#import "@preview/cetz:0.3.4": canvas, draw

// Chinese font configuration
#set text(
  font: (
    "Kaiti SC",
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
    周报 向嘉豪(2026-02-09)
  ]
]

#v(1em)

#text(size: 14pt, weight: "bold")[摘要:]
本周#redt[完成硕士学位论文第五章面向GPU的AES算法线程自适应并行优化实现的撰写工作]，提出了自适应线程分配（ATA）和函数级并行化（FLP）策略，在NVIDIA RTX 4090上实现AES-128-CTR模式1842 Gb/s的加密吞吐量。同时#bluet[对第四篇小论文中ML-DSA的格密码学基础进行系统梳理]，完成了格几何、短向量问题（SVP）、最近向量问题（CVP）、短整数解问题（SIS）以及ML-DSA签名方案三阶段流程的图解。

#v(1em)

// Week plan box
#rect(width: 100%, stroke: 1pt, inset: 10pt, [
  #text(weight: "bold")[下周计划:]
  1) 继续修改第四篇小论文
  2) 完成硕士学位论文的撰写工作
])

#v(1em)

= 硕士学位论文撰写

== 第五章面向GPU的AES算法线程自适应并行优化实现

完成了第五章面向GPU的AES算法线程自适应并行优化实现的撰写工作，该章节包括AES算法与GPU计算模型、线程自适应GPU优化方法、GPU实现结果与吞吐量评估三个主要部分。#redt[本章提出了自适应线程分配（ATA）策略，通过建立执行时间性能模型$T(g_i, t) = alpha_i + beta_i\/t + gamma_i dot t$，针对AES不同操作动态确定最优线程配置$t_i^* = sqrt(beta_i\/gamma_i)$]，并结合函数级并行化（FLP）方法将AES核心操作（SubBytes、ShiftRows/MixColumns、AddRoundKey）分解为可并发执行的细粒度计算任务。

性能评估部分在NVIDIA RTX 4090 GPU上进行测试，AES-128-CTR模式达到1842 Gb/s（230.3 GB/s）的吞吐量，AES-128-ECB模式达到1596 Gb/s（199.5 GB/s）。#bluet[延迟分解分析表明SubBytes操作占总执行时间的68.7%，ShiftRows/MixColumns贡献23.8%，AddRoundKey仅占7.5%]。AES-256相比AES-128的性能下降约16--17%，主要原因是轮数增加（14轮 vs 10轮）和密钥扩展的额外计算开销。

= 第四篇小论文——ML-DSA格密码学基础梳理

本周对第四篇小论文中ML-DSA的格密码学理论基础进行系统梳理与可视化图解，涵盖格基础概念、核心困难问题与ML-DSA方案流程。

== 格的基本概念与基变换

格是由$m$个线性无关向量的整数线性组合构成的离散点集$cal(L)(B) = {B bold(z) : bold(z) in ZZ^m}$。同一格可由不同基描述，密码学利用"好基"（短且近正交）与"坏基"（长且倾斜）之间的计算不对称性构建安全方案。

#figure(
  caption: [二维格及其基本平行四边形。],
  canvas(length: 0.8cm, {
    import draw: *
    line((0, 0), (1.8, 0.0), (2.7, 1.4), (0.9, 1.4), close: true, fill: rgb("#DBEAFE"), stroke: (
      paint: rgb("#93C5FD"),
      thickness: 0.6pt,
      dash: "dashed",
    ))
    for ix in range(-3, 5) {
      for iy in range(-3, 4) {
        let px = ix * 0.9 + iy * 0.9
        let py = iy * 1.4
        if px >= -3.5 and px <= 4.5 and py >= -3.5 and py <= 4.0 {
          circle((px, py), radius: 0.05, fill: rgb("#6B7280"))
        }
      }
    }
    set-style(mark: (end: ">", size: 0.15))
    line((0, 0), (1.8, 0.0), stroke: (paint: rgb("#2563EB"), thickness: 1.6pt))
    line((0, 0), (0.9, 1.4), stroke: (paint: rgb("#DC2626"), thickness: 1.6pt))
    content((1.9, -0.25), text(fill: rgb("#2563EB"), weight: "bold")[$bold(b)_1$])
    content((0.55, 1.55), text(fill: rgb("#DC2626"), weight: "bold")[$bold(b)_2$])
    content((-0.2, -0.2), text(weight: "bold")[$bold(0)$])
    circle((2.7, 1.4), radius: 0.08, fill: rgb("#F59E0B"))
    content((3.3, 1.55), text(size: 9pt, fill: rgb("#B45309"))[$bold(b)_1 + bold(b)_2$])
  }),
)

#figure(
  caption: [同一格的好基（左）与坏基（右）。],
  canvas(length: 0.7cm, {
    import draw: *
    for ix in range(-3, 5) {
      for iy in range(-3, 5) {
        let px = ix * 1.0 + iy * 0.2
        let py = iy * 1.0
        if px >= -2.5 and px <= 4.0 and py >= -2.5 and py <= 3.5 {
          circle((px - 5.0, py), radius: 0.05, fill: rgb("#6B7280"))
        }
      }
    }
    set-style(mark: (end: ">", size: 0.12))
    line((-5.0, 0), (-4.0, 0), stroke: (paint: rgb("#059669"), thickness: 1.6pt))
    line((-5.0, 0), (-4.8, 1.0), stroke: (paint: rgb("#059669"), thickness: 1.6pt))
    content((-3.7, -0.25), text(size: 9pt, fill: rgb("#059669"))[$bold(b)_1$])
    content((-4.5, 1.15), text(size: 9pt, fill: rgb("#059669"))[$bold(b)_2$])
    content((-3.5, -1.8), text(size: 9pt, weight: "bold")[好基])
    for ix in range(-3, 5) {
      for iy in range(-3, 5) {
        let px = ix * 1.0 + iy * 0.2
        let py = iy * 1.0
        if px >= -2.5 and px <= 4.0 and py >= -2.5 and py <= 3.5 {
          circle((px + 2.0, py), radius: 0.05, fill: rgb("#6B7280"))
        }
      }
    }
    line((2.0, 0), (5.2, 2.0), stroke: (paint: rgb("#DC2626"), thickness: 1.6pt))
    line((2.0, 0), (4.4, 3.0), stroke: (paint: rgb("#DC2626"), thickness: 1.6pt))
    content((5.5, 2.0), text(size: 9pt, fill: rgb("#DC2626"))[$bold(b)'_1$])
    content((4.7, 3.15), text(size: 9pt, fill: rgb("#DC2626"))[$bold(b)'_2$])
    content((3.5, -1.8), text(size: 9pt, weight: "bold")[坏基])
  }),
)

== 格上核心困难问题

格密码学的安全性建立在三个核心困难问题之上。SVP要求找到格中最短非零向量，在高维下具有指数级复杂度且无已知量子加速。CVP要求找到距目标点最近的格点，ML-DSA签名本质上是有界距离解码问题。SIS要求找到满足$bold(A) bold(x) = bold(0) mod q$且$norm(bold(x))_infinity <= beta$的短向量，ML-DSA验证依赖于该问题的困难性。

#figure(
  caption: [SVP：虚线圆半径$lambda_1$内无非零格点。],
  canvas(length: 0.8cm, {
    import draw: *
    for x in range(-4, 5) {
      for y in range(-4, 5) {
        let px = x * 0.9
        let py = y * 0.9
        if px >= -3.2 and px <= 3.2 and py >= -3.2 and py <= 3.2 {
          circle((px, py), radius: 0.04, fill: rgb("#9CA3AF"))
        }
      }
    }
    circle((0, 0), radius: 0.08, fill: rgb("#111827"))
    circle((0, 0), radius: 0.9, stroke: (paint: rgb("#F59E0B"), thickness: 1pt, dash: "dashed"))
    content((0.3, 0.75), text(size: 8pt, fill: rgb("#B45309"))[$lambda_1$])
    set-style(mark: (end: ">", size: 0.12))
    line((0, 0), (0.9, 0.0), stroke: (paint: rgb("#059669"), thickness: 2pt))
    content((0.95, -0.2), text(size: 9pt, fill: rgb("#059669"), weight: "bold")[最短向量])
    line((0, 0), (1.8, 0.9), stroke: (paint: rgb("#9CA3AF"), thickness: 1pt, dash: "dotted"))
    content((2.1, 1.0), text(size: 8pt, fill: rgb("#6B7280"))[较长向量])
  }),
)

#figure(
  caption: [CVP：找到距目标$bold(t)$最近的格点$bold(v)^*$。],
  canvas(length: 0.8cm, {
    import draw: *
    for x in range(-4, 5) {
      for y in range(-4, 5) {
        let px = x * 1.0
        let py = y * 1.0
        if px >= -3.5 and px <= 3.5 and py >= -3.5 and py <= 3.5 {
          circle((px, py), radius: 0.04, fill: rgb("#9CA3AF"))
        }
      }
    }
    let tx = 1.3
    let ty = 0.7
    circle((1.0, 1.0), radius: 0.08, fill: rgb("#059669"))
    content((1.3, 1.2), text(size: 9pt, fill: rgb("#059669"), weight: "bold")[$bold(v)^*$])
    circle((tx, ty), radius: 0.42, stroke: (paint: rgb("#F59E0B"), thickness: 0.8pt, dash: "dashed"))
    line((tx - 0.1, ty - 0.1), (tx + 0.1, ty + 0.1), stroke: (paint: rgb("#DC2626"), thickness: 1.5pt))
    line((tx - 0.1, ty + 0.1), (tx + 0.1, ty - 0.1), stroke: (paint: rgb("#DC2626"), thickness: 1.5pt))
    content((tx + 0.3, ty - 0.2), text(size: 9pt, fill: rgb("#DC2626"), weight: "bold")[$bold(t)$])
    set-style(mark: (end: ">", size: 0.1))
    line((tx, ty), (1.02, 0.98), stroke: (paint: rgb("#059669"), thickness: 1.2pt, dash: "dotted"))
  }),
)

#figure(
  caption: [SIS：解空间中仅少数格点为短向量。],
  canvas(length: 0.8cm, {
    import draw: *
    line((-3.5, -1.5), (3.5, 1.5), stroke: (paint: rgb("#D1D5DB"), thickness: 8pt))
    for i in range(-3, 4) {
      let px = i * 1.0
      let py = i * 0.43
      circle((px, py), radius: 0.05, fill: rgb("#9CA3AF"))
    }
    circle((0, 0), radius: 0.08, fill: rgb("#111827"))
    content((-0.3, -0.3), text(size: 9pt)[$bold(0)$])
    circle((1.0, 0.43), radius: 0.08, fill: rgb("#059669"))
    content((1.3, 0.65), text(size: 9pt, fill: rgb("#059669"), weight: "bold")[短向量 $bold(x)$])
    circle((3.0, 1.29), radius: 0.06, fill: rgb("#DC2626"))
    content((3.3, 1.5), text(size: 8pt, fill: rgb("#DC2626"))[长向量 $bold(x)$])
    circle((0, 0), radius: 1.2, stroke: (paint: rgb("#F59E0B"), thickness: 0.8pt, dash: "dashed"))
    content((0.9, -0.9), text(size: 8pt, fill: rgb("#B45309"))[$norm(bold(x)) <= beta$])
  }),
)

== ML-DSA签名方案三阶段流程

ML-DSA基于Fiat-Shamir with Aborts范式，包含密钥生成、签名和验证三个阶段。密钥生成从种子$xi$派生$bold(A)$和短秘密$bold(s)_1, bold(s)_2$，计算$bold(t) = bold(A) bold(s)_1 + bold(s)_2$并分割为公钥$bold(t)_1$和私钥$bold(t)_0$，安全性基于Module-LWE困难性。

#figure(
  caption: [ML-DSA三阶段流程概览。],
  canvas(length: 0.75cm, {
    import draw: *
    rect((4.0, 5.8), (7.0, 6.5), stroke: rgb("#6B7280"), radius: 0.08, fill: rgb("#F3F4F6"))
    content((5.5, 6.15), text(size: 8pt, weight: "bold")[种子 $xi in {0,1}^(256)$])
    set-style(mark: (end: ">", size: 0.1))
    line((5.5, 5.75), (5.5, 5.25), stroke: (paint: rgb("#6B7280"), thickness: 0.8pt))
    rect((2.5, 3.8), (8.5, 5.25), stroke: rgb("#2563EB"), radius: 0.1, fill: rgb("#EFF6FF"))
    content((5.5, 4.95), text(size: 9pt, fill: rgb("#2563EB"), weight: "bold")[密钥生成])
    content((5.5, 4.55), text(size: 7.5pt)[$rho, rho', K = H(xi)$])
    content((5.5, 4.2), text(size: 7.5pt)[$bold(A) = "ExpandA"(rho), quad bold(s)_1, bold(s)_2 = "ExpandS"(rho')$])
    content((5.5, 3.9), text(size: 7.5pt)[$bold(t) = bold(A) bold(s)_1 + bold(s)_2$])
    line((3.5, 3.75), (3.5, 3.0), stroke: (paint: rgb("#2563EB"), thickness: 0.8pt))
    line((7.5, 3.75), (7.5, 3.0), stroke: (paint: rgb("#2563EB"), thickness: 0.8pt))
    rect((1.5, 2.2), (5.5, 3.0), stroke: rgb("#059669"), radius: 0.08, fill: rgb("#ECFDF5"))
    content((3.5, 2.7), text(size: 8pt, fill: rgb("#059669"), weight: "bold")[私钥])
    content((3.5, 2.35), text(size: 7pt)[$"sk" = (rho, K, "tr", bold(s)_1, bold(s)_2, bold(t)_0)$])
    rect((5.8, 2.2), (9.5, 3.0), stroke: rgb("#7C3AED"), radius: 0.08, fill: rgb("#F5F3FF"))
    content((7.65, 2.7), text(size: 8pt, fill: rgb("#7C3AED"), weight: "bold")[公钥])
    content((7.65, 2.35), text(size: 7pt)[$"pk" = (rho, bold(t)_1)$])
    line((3.5, 2.15), (3.5, 1.5), stroke: (paint: rgb("#059669"), thickness: 0.8pt))
    rect((0.5, -0.8), (6.5, 1.5), stroke: rgb("#059669"), radius: 0.1, fill: rgb("#F0FDF4"))
    content((3.5, 1.2), text(size: 9pt, fill: rgb("#059669"), weight: "bold")[签名])
    content((3.5, 0.8), text(size: 7.5pt)[$bold(y) arrow.l "ExpandMask"(rho'', kappa)$])
    content((3.5, 0.45), text(size: 7.5pt)[$bold(w) = bold(A) bold(y), quad tilde(c) = H(mu || bold(w)_1)$])
    content((3.5, 0.1), text(size: 7.5pt)[$c = "SampleInBall"(tilde(c)), quad bold(z) = bold(y) + c bold(s)_1$])
    content((3.5, -0.25), text(
      size: 7.5pt,
      fill: rgb("#DC2626"),
    )[若 $norm(bold(z))_infinity >= gamma_1 - beta$ 或提示失败：*重启*])
    content((3.5, -0.6), text(size: 7.5pt)[$sigma = (tilde(c), bold(z), bold(h))$])
    bezier((6.6, 0.1), (6.6, 1.6), (7.4, 0.1), (7.4, 1.6), stroke: (
      paint: rgb("#DC2626"),
      thickness: 0.7pt,
      dash: "dashed",
    ))
    line((6.6, 1.6), (5.8, 1.6), stroke: (paint: rgb("#DC2626"), thickness: 0.7pt, dash: "dashed"))
    content((7.8, 0.85), text(size: 6.5pt, fill: rgb("#DC2626"))[中止并重试])
    line((7.65, 2.15), (7.65, 1.5), stroke: (paint: rgb("#7C3AED"), thickness: 0.8pt))
    rect((8.0, -0.8), (14.0, 1.5), stroke: rgb("#7C3AED"), radius: 0.1, fill: rgb("#FAF5FF"))
    content((11.0, 1.2), text(size: 9pt, fill: rgb("#7C3AED"), weight: "bold")[验证])
    content((11.0, 0.8), text(size: 7.5pt)[$bold(A) = "ExpandA"(rho)$])
    content((11.0, 0.45), text(size: 7.5pt)[$bold(w)'_1 = "UseHint"(bold(h), bold(A) bold(z) - c bold(t))$])
    content((11.0, 0.1), text(size: 7.5pt)[$"检查:" norm(bold(z))_infinity < gamma_1 - beta$])
    content((11.0, -0.25), text(size: 7.5pt)[$"检查:" tilde(c) =^? H(mu || bold(w)'_1)$])
    content((11.0, -0.6), text(size: 7.5pt, fill: rgb("#059669"), weight: "bold")[接受 / 拒绝])
    line((6.6, -0.15), (7.9, -0.15), stroke: (paint: rgb("#6B7280"), thickness: 0.8pt))
    content((7.25, 0.05), text(size: 6.5pt, fill: rgb("#6B7280"))[$sigma$])
  }),
)

签名阶段采用拒绝采样：选取掩码$bold(y)$，计算$bold(z) = bold(y) + c bold(s)_1$，若$norm(bold(z))_infinity >= gamma_1 - beta$则重启，确保$bold(z)$分布与$bold(s)_1$无关。

#figure(
  caption: [签名几何：$bold(z) = bold(y) + c bold(s)_1$须落在接受区域内。],
  canvas(length: 0.65cm, {
    import draw: *
    rect((-5.0, -5.0), (5.0, 5.0), stroke: (paint: rgb("#2563EB"), thickness: 1pt), fill: rgb("#EFF6FF"))
    content((3.8, 5.3), text(size: 7pt, fill: rgb("#2563EB"))[$[-gamma_1, gamma_1]^(n l)$])
    rect(
      (-4.0, -4.0),
      (4.0, 4.0),
      stroke: (paint: rgb("#059669"), thickness: 1pt, dash: "dashed"),
      fill: rgb("#F0FDF4"),
    )
    content((2.5, 4.3), text(size: 7pt, fill: rgb("#059669"))[$[-gamma_1 + beta, gamma_1 - beta]$])
    circle((0, 0), radius: 0.1, fill: rgb("#111827"))
    content((-0.4, -0.35), text(size: 8pt, weight: "bold")[$bold(0)$])
    set-style(mark: (end: ">", size: 0.12))
    line((0, 0), (1.5, 2.5), stroke: (paint: rgb("#2563EB"), thickness: 1.6pt))
    content((0.6, 2.7), text(size: 8pt, fill: rgb("#2563EB"), weight: "bold")[$bold(y)$])
    line((1.5, 2.5), (2.2, 3.0), stroke: (paint: rgb("#F59E0B"), thickness: 1.4pt))
    content((2.4, 3.3), text(size: 7pt, fill: rgb("#B45309"))[$c bold(s)_1$])
    line((0, 0), (2.2, 3.0), stroke: (paint: rgb("#059669"), thickness: 1.8pt, dash: "densely-dotted"))
    circle((2.2, 3.0), radius: 0.12, fill: rgb("#059669"))
    content((2.9, 3.0), text(size: 8pt, fill: rgb("#059669"), weight: "bold")[$bold(z)$ ✓])
    line((0, 0), (-2.5, -3.5), stroke: (paint: rgb("#93C5FD"), thickness: 1.2pt))
    content((-1.8, -3.7), text(size: 7pt, fill: rgb("#93C5FD"))[$bold(y)'$])
    line((-2.5, -3.5), (-3.0, -4.2), stroke: (paint: rgb("#FCD34D"), thickness: 1pt))
    circle((-3.0, -4.2), radius: 0.1, fill: rgb("#DC2626"))
    line((-3.2, -4.4), (-2.8, -4.0), stroke: (paint: rgb("#DC2626"), thickness: 1.8pt))
    line((-3.2, -4.0), (-2.8, -4.4), stroke: (paint: rgb("#DC2626"), thickness: 1.8pt))
    content((-3.8, -4.2), text(size: 7pt, fill: rgb("#DC2626"))[$bold(z)'$ ✗])
    set-style(mark: (end: "|", size: 0.08))
    line((5.2, 4.0), (5.2, 5.0), stroke: (paint: rgb("#6B7280"), thickness: 0.6pt))
    content((5.8, 4.5), text(size: 6.5pt, fill: rgb("#6B7280"))[$beta$])
  }),
)

验证阶段利用$bold(A) bold(z) - c bold(t) = bold(w) - c bold(s)_2$重构$bold(w)'_1$，由于$c bold(s)_2$为短向量，高位比特匹配$bold(w)_1$，提示$bold(h)$修正舍入误差后验证哈希一致性。


#figure(
  caption: [验证代数：$bold(A) bold(z) - c bold(t) = bold(w) - c bold(s)_2$，短向量$c bold(s)_2$保证高位匹配。],
  canvas(length: 0.8cm, {
    import draw: *

    // Lattice points (background)
    for x in range(-2, 7) {
      for y in range(-1, 6) {
        let px = x * 1.2
        let py = y * 1.2
        if px >= -1.5 and px <= 7.5 and py >= -0.5 and py <= 6.0 {
          circle((px, py), radius: 0.035, fill: rgb("#E5E7EB"))
        }
      }
    }

    // Origin
    circle((0, 0), radius: 0.06, fill: rgb("#111827"))
    content((-0.3, -0.2), text(size: 7pt)[$bold(0)$])

    // A*z (lattice point)
    let azx = 4.8
    let azy = 4.8
    circle((azx, azy), radius: 0.09, fill: rgb("#2563EB"))
    content((azx + 0.4, azy + 0.25), text(size: 8pt, fill: rgb("#2563EB"), weight: "bold")[$bold(A) bold(z)$])

    // c*t (the vector to subtract)
    set-style(mark: (end: ">", size: 0.1))
    line((azx, azy), (azx - 1.5, azy - 1.2), stroke: (paint: rgb("#DC2626"), thickness: 1.4pt))
    content((azx - 0.3, azy - 0.9), text(size: 7pt, fill: rgb("#DC2626"))[$-c bold(t)$])

    // A*z - c*t = w - c*s2
    let rx = azx - 1.5
    let ry = azy - 1.2
    circle((rx, ry), radius: 0.09, fill: rgb("#F59E0B"))
    content((rx - 1.0, ry + 0.3), text(size: 7pt, fill: rgb("#B45309"))[$bold(w) - c bold(s)_2$])

    // w (the original commitment, nearby)
    let wx = 3.6
    let wy = 3.6
    circle((wx, wy), radius: 0.09, fill: rgb("#059669"))
    content((wx - 0.8, wy - 0.3), text(size: 8pt, fill: rgb("#059669"), weight: "bold")[$bold(w)$])

    // c*s2 is the small gap
    line((rx, ry), (wx, wy), stroke: (paint: rgb("#9CA3AF"), thickness: 0.8pt, dash: "dotted"))
    content((rx + 0.6, ry - 0.3), text(size: 6pt, fill: rgb("#6B7280"))[$c bold(s)_2$ (短向量)])

    // HighBits annotation
    rect((0.5, 1.5), (3.0, 2.2), stroke: rgb("#7C3AED"), radius: 0.06, fill: rgb("#F5F3FF"))
    content((1.75, 1.85), text(size: 7pt, fill: rgb("#7C3AED"))[高位比特匹配!])
    line((1.75, 2.25), (wx - 0.1, wy - 0.1), stroke: (paint: rgb("#7C3AED"), thickness: 0.6pt, dash: "dotted"))
    line((1.75, 2.25), (rx + 0.1, ry - 0.1), stroke: (paint: rgb("#7C3AED"), thickness: 0.6pt, dash: "dotted"))

    // Label
    content((5.5, 6.0), text(size: 7pt, fill: rgb("#6B7280"))[格 $= {bold(A) bold(x) : bold(x) in R_q^l}$])
  }),
)

