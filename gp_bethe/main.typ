#import "@preview/touying:0.4.2": *
#import "@preview/touying-simpl-hkustgz:0.1.1" as hkustgz-theme
#import "@preview/physica:0.9.3": *
#import "@preview/cetz:0.3.0"

#let s = hkustgz-theme.register()

// Global information configuration
#let s = (s.methods.info)(
  self: s,
  title: [Touying for HKUSTGZ: Customize Your Slide Title Here],
  subtitle: [Customize Your Slide Subtitle Here],
  author: [Zhongyi Ni],
  date: datetime.today(),
  institution: [HKUST(GZ)],
  others: none
)

// Extract methods
#let (init, slides) = utils.methods(s)
#show: init

// Extract slide functions
#let (slide, empty-slide, title-slide, outline-slide, new-section-slide, ending-slide) = utils.slides(s)
#show: slides.with()

= Introduction

== Introduction


== Brief History of Bethe Ansatz

1. The XXX spin chain: Hans Bethe (1931), Coordinate Bethe Ansatz
2. The XXZ spin chain: Simple Generalization, C. N. Yang and C. P. Yang (1966)
3. The XYZ spin chain: Rodneys Baxter (1972), 2d eight-vertex model is equivalent to 1d XYZ spin chain
4. Algebraic Bethe Ansatz (Quantum Inverse Scattering Method): L. D. Faddeev (mid 1970s), Underlying algebraic structure of the intergrable models
5. Quantum group: V. G. Drinfeld (1985), M. Jimbo (1986), more abstract algebraic structure called quantum group, a special case of Hopf algebra

== Materials
1. 量子可积系统导论, 江云峰 (https://www.koushare.com/live/details/11505?vid=33788)

= XXX Spin Chain
== XXX Spin Chain
== Hamiltonian (Periodic Boundary Condition)

$ 
  H_(X X X)  &= -J sum_(n = 1)^L S^x_n S^x_(n+1)+S^y_n S^y_(n+1)+S^z_n S^z_(n+1)  \
        &=  -J/2 sum_(n = 1)^L  S^-_n S^+_(n+1)+S^+_n S^-_(n+1)+2S^z_n S^z_(n+1)\
$
Here $S^alpha _n = 1/2 sigma^alpha _n$ and $S^plus.minus_n = S^x_n plus.minus i S^y_n$. From now on, we will set $J = 1$.

== Number of Spin-downs


#slide(composer: (0.5fr, 1fr))[
// #show math.equation: set text(9pt)
Vacuum: $ket(arrow.t)$ or $ket(1)$
  
Excitation (magnon): $ket(arrow.b)$ or $ket(0)$
][

Example $ L = 3:$
- Vacuum: $ket(arrow.t arrow.t arrow.t)$
- One spin-down: $ket(arrow.b arrow.t arrow.t)$, $ket(arrow.t arrow.b arrow.t)$, $ket(arrow.t arrow.t arrow.b)$
- Two spin-downs: $ket(arrow.b arrow.b arrow.t)$, $ket(arrow.b arrow.t arrow.b)$, $ket(arrow.t arrow.b arrow.b)$
- Three spin-downs: $ket(arrow.b arrow.b arrow.b)$
 $ 
  H_(X X X) =  -1/2 sum_(n = 1)^L  S^-_n S^+_(n+1)+S^+_n S^-_(n+1)+2S^z_n S^z_(n+1)
$]

== Vacuum
$
H_(X X X) =  -1/2 sum_(n = 1)^L  S^-_n S^+_(n+1)+S^+_n S^-_(n+1)+2S^z_n S^z_(n+1)
$


Pseudo-vacuum state: $ket(Omega)= ket(attach(
  arrow.t, tr: L,
) )$

$
H_(X X X) ket(Omega) = - sum_(n = 1)^L S^z_n S^z_(n+1) ket(Omega) = -L/4 ket(Omega) = E_0 ket(Omega)
$

Notation: $ket(n_1 \, n_2 \,dots \, n_N  ) = S^-_(n_1) S^-_(n_2) dots S^-_(n_N) ket(Omega)$

== One Magnon

Bethe Ansatz: 
$ 
ket(psi (p)) = sum_(n = 1)^L e^(i p n) ket(n)
$
indeed,
$
  H_(X X X) ket(psi (p)) = E_1(p) ket(psi (p))
$
$
  E_1(p) = 1-cos(p) + E_0
$
with $p = (2 pi m)/L$, $m = 1, 2, dots, L$

== Two Magnons
Bethe Ansatz:
$
ket(psi (p_1, p_2)) = sum_(1 lt.eq n_1 lt n_2 lt.eq L) chi(p_1, p_2|n_1, n_2) ket(n\, m)
$
with 
$
chi(p_1, p_2|n_1, n_2) = A(p_1,p_2)e^(i p_1 n_1 + i p_2 n_2) +A(p_2,p_1) e^(i p_1 n_2 + i p_2 n_1)
$
Plugging into the following equation
$
H_(X X X) ket(psi (p_1, p_2)) = E_2(p_1, p_2) ket(psi (p_1, p_2))
$
we get
$
E_2(p_1, p_2) = 2-cos(p_1) - cos(p_2) + E_0, \ 
S(p_1,p_2) = A(p_1,p_2)/A(p_2,p_1) = - (1-2e^(i p_2)+ e^(i (p_1 + p_2)))/(1-2e^(i p_1)+ e^(i (p_1 + p_2))), \ 
e^(i p_1 L) S(p_1,p_2) = e^(i p_2 L) S(p_2,p_1) = 1
$

== Three Magnons
$
  ket(psi (p_1, p_2, p_3)) = sum_(1 lt.eq n_1 lt n_2 lt n_3 lt.eq L) chi(p_1, p_2, p_3|n_1, n_2, n_3) ket(n_1\, n_2\, n_3)
$
$
  chi(p_1, p_2, p_3|n_1, n_2, n_3) = sum_(sigma in S_3) A(p_sigma) e^(i (p_(sigma(1)) n_1 +  p_(sigma(2)) n_2 +  p_(sigma(3)) n_3))
$
$
  E_3(p_1, p_2, p_3) = 3-cos(p_1) - cos(p_2) - cos(p_3) + E_0
$

== $A(p(sigma)) \/ A(p)$?

Bethe Ansatz:
$
  A(p_3,p_2,p_1) & = S(p_1,p_2)A(p_3,p_1,p_2) = S(p_1,p_2)S(p_1,p_3)A(p_2,p_1,p_3) \ 
  & = S(p_1,p_2)S(p_1,p_3)S(p_2,p_3)A(p_1,p_2,p_3)
$
Solve this?

Boundary condition: 
$
e^(i p_1 L) S(p_1,p_2)S(p_1,p_3) = e^(i p_2 L) S(p_2,p_1)S(p_2,p_3) = e^(i p_3 L) S(p_3,p_1)S(p_3,p_2) = 1
$
$N$-magnon case is similar.

= Algebraic Bethe Ansatz

== Lax Matrix

#slide(composer: (0.5fr, 1fr))[
  #import "@preview/cetz:0.3.0"
#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: (100pt, 40pt))
  circle((1, 1.3),radius: 5pt, fill: black)
  circle((1, -1.4),radius: 5pt, fill: black)
  circle((-0.5, 1.4),radius: 5pt, fill: black)
  circle((-2, 1.1), radius: 5pt, fill: black)

  content((-0.5, 2), "1")
  content((1,2),"2")
  content((1,-2),"n")
  content((-2,1.8),"L")

  circle((2, 1),radius: 2pt, fill: black)
  circle((2.5, 0.8),radius: 2pt, fill: black)
  circle((2.9, 0.6),radius: 2pt, fill: black)

  circle((0, -1.2),radius: 2pt, fill: black)
  circle((-0.5, -1.2),radius: 2pt, fill: black)
  circle((-1, -1.1),radius: 2pt, fill: black)
})
][
$
  L_(a n) (u) = mat(
  u + i S^z_n, i S^-_n;
  i S ^+_n,  u - i S^z_n;
)_a in bb(C)^2_a times.circle V_n 
$
$
L_(a n) (u) &= L_(a n) (u) times.circle I_b \ 
& = mat(
  u+i S^z_n, 0, i S^-_n, 0;
  0, u+i S^z_n, 0, i S^-_n;
  i S ^+_n, 0, u - i S^z_n, 0;
  0, i S ^+_n, 0, u - i S^z_n;
)_(a b)
$]

== RLL Relation
$
  R_(a b) (u-v) L_(a n) (u) L_(b n) (v) = L_(b n) (v) L_(a n) (u) R_(a b) (u-v)
$
$
  R_(a b) (u-v) = mat(
  u-v+i, 0, 0, 0;
  0, u-v, i, 0;
  0, i, u-v, 0;
  0, 0, 0, u-v+i;
  )_(a b)
$


== Monodromy Matrix

$
  M_a (u) = L_(a 1) (u)L_(a 2) (u) dots L_(a L) (u) = mat(
  A(u), B(u);
  C(u), D(u);
  ) 
$

RMM Relation:
$
R_(a b) (u-v) M_a (u) M_b (v) = M_b (v) M_a (u) R_(a b) (u-v)
$
which implies the algebraic relationship between ABCDs, for example:
$
B(u)B(v) = B(v)B(u), \
 A(u)B(v) = f(u-v)B(v)A(u) + g(u-v)B(u)A(v), \ 
D(u)B(v) = f(u-v)B(v)D(u) + g(v-u)B(u)D(v)
$
where $f(u) = (u+i)/(u)$ and $g(u) = i/(u)$.

== Transfer Matrix
$
  T(u) = tr_a M_a(u) = A(u) + D(u)
$
$
  [T(u), T(v)] = 0
$

== Yang-Baxter Equation
$
  M_a M_b M_c arrow M_b M_a M_c arrow M_b M_c M_a arrow M_c M_b M_a
$
$
  M_a M_b M_c arrow M_a M_c M_b arrow M_c M_a M_b arrow M_c M_b M_a
$
$
  R_(a b) (u_1, u_2) R_(a c) (u_1, u_3) R_(b c) (u_2, u_3) = R_(b c) (u_2, u_3) R_(a c) (u_1, u_3) R_(a b) (u_1, u_2)
$
== Hamiltonian
$
  H = -d/(d u) log T(u) |_(u=i/2)
$
$
  B(u_1)B(u_2) ... B(u_N) ket(Omega)
$

== Construction of Eigenstates
$
  L_(a n) (u) = mat(
  u + i S^z_n, i S^-_n;
  i S ^+_n,  u - i S^z_n;
)_a 
$
$
  M_a (u) ket(attach(
  arrow.t, tr: L,
) ) & = (L_(a 1) (u) ket(arrow.t)) times.circle (L_(a 2) (u) ket(arrow.t)) times.circle dots times.circle (L_(a L) (u) ket(arrow.t)) \ 
  & = mat(u+i/2, i S_1^-; 0, u-i/2) ket(arrow.t) times.circle mat(u+i/2, i S_2^-; 0, u-i/2) ket(arrow.t) times.circle dots times.circle mat(u+i/2, i S_L^-; 0, u-i/2) ket(arrow.t) \
  & = mat((u+i/2)^L, star ; 0, (u-i/2)^L) ket(attach(
  arrow.t, tr: L,
) ) = mat(A(u), B(u);C(u),D(u)) ket(attach(
  arrow.t, tr: L,
) )
$
$
  A(u) ket(attach(arrow.t,tr:L))= (u+i/2)^L ket(attach(arrow.t,tr:L)), D(u) ket(attach(arrow.t,tr:L)) = (u-i/2)^L ket(attach(arrow.t,tr:L))
$
$
  ket(bold(upright(u))_N) = B(u_1)B(u_2) ... B(u_N) ket(attach(arrow.t,tr:L)) 
$
$
  A(u) ket(bold(upright(u))_N) &= A(u) B(u_1)B(u_2) ... B(u_N) ket(attach(arrow.t,tr:L)) \ 
  & = (u+i/2)^L B(u_1)B(u_2) ... B(u_N) ket(attach(arrow.t,tr:L)) \ 
  & + sum_(k = 1) ^ N M_k (u|bold(upright(u))_(N)) B(u_1) ... B(u_(k-1)) B(u_(k+1)) ... B(u_N) B(u) ket(attach(arrow.t,tr:L)) \
$
$
  D(u) ket(bold(upright(u))_N) & = (u-i/2)^L B(u_1)B(u_2) ... B(u_N) ket(attach(arrow.t,tr:L)) \ 
  & + sum_(k = 1) ^ N N_k (u|bold(upright(u))_(N)) B(u_1) ... B(u_(k-1)) B(u_(k+1)) ... B(u_N) B(u) ket(attach(arrow.t,tr:L)) \
$
We demand 
$
  M_k (u|bold(upright(u))_(N)) + N_k (u|bold(upright(u))_(N)) = 0
$
which gives the Bethe Ansatz equation.

== Quantum Intergrablity
Ref: 量子可积系统导论2:13:00

Examples:
- Lattice models: 
1. Heisenberg: XXX, XXZ, XYZ spin chains, different boundary conditions, non-local interactions...
2. Statistical mechanics: Ising, 6-vertex model, 8-vertex model...
3. Stronly Correlated: Hubbard model, t-J model

- continious models:
1. Non-relativistic: Lieb-liniger, Calogero-Sutherland...
2. Relativistic: CFT, Sine-Gordon, Scaling Lee-Yang model...

== Classical Intergrablity

Liouville integrability:
1. $exists N$ conserved quantities $I_1, I_2, dots, I_N$ in involution, i.e., ${I_i, I_j} = 0$
2. $I_1, I_2, dots, I_N$ are functionally independent on the phase space
3. ${H,I_j} = 0$

Problems of Generalization in Quantum:
1. Degree of freedom $N$: Site number? Hillbert space dimension?
2. $H = sum lambda ket(lambda)bra(lambda)$, then $I_lambda = ket(lambda)bra(lambda)$
3. Hard to define independence of $I_lambda$: 

== Slide II / i

Slide content.

== Slide II / ii

Slide content.
#slide[
#show math.equation: set text(10pt)
$ x^ +1 = 0 $

#show math.equation: set text(50pt)

#grid(columns: (1fr, 1fr), $ x^2+1=0 $, $ x^2+2=0 $)
]

#pagebreak()
#bibliography("refs.bib")