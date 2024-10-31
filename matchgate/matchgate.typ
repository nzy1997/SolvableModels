#import "@preview/cetz:0.2.2": canvas, draw, tree
#import "@preview/ouset:0.2.0": ouset
#import "@preview/unequivocal-ams:0.1.1": ams-article, theorem, proof
#show link: set text(blue)

#let jinguo(txt) = {
  text(blue, [[JG: #txt]])
}

#set math.equation(numbering: "(1)")

#show: ams-article.with(
  title: [A note of match gate simulation],
  authors: (
    (
      name: "Jin-Guo Liu",
      department: [Advanced Materials Thrust],
      organization: [Hong Kong University of Science and Technology (Guangzhou)],
      email: "jinguoliu@hkust-gz.edu.cn",
    ),
  ),
  abstract: [Match gate],
  bibliography: bibliography("refs.bib"),
)

// The ASM template also provides a theorem function.
#let definition(title, body, numbered: true) = figure(
  body,
  kind: "theorem",
  supplement: [Definition (#title)],
  numbering: if numbered { "1" },
)

= Majorana fermions
#definition("Majorana Fermion", [Majorana fermions are linear operators with the following properties:
$
a_i^2 &= 1\
a_i^dagger &= a_i\
{a_i, a_j} &= 2 delta_(i j)
$ <eq:majorana>
])

Some extra properties can be derived:
- Let $R in S O(2n)$ be a real orthogonal matrix that represents some rotation operation, $bold(a) = (a_1, a_2, dots, a_(2n))$ be a vector of Majorana fermions. Then $bold(b) = R bold(a)$ is also a vector of Majorana fermions, i.e. satisfying @eq:majorana.

- $ [a_i, a_j a_k] &= a_i a_j a_k - a_j a_k a_i\ &= a_i a_j a_k - a_j (2 delta_(i k) - a_i a_k)\ &= -2delta_(i k) a_j + {a_i, a_j} a_k\ &= -2delta_(i k) a_j + 2delta_(i j) a_k, $ <eq:commute>
which is $0$ when $i eq.not j$, and $i eq.not k$.

= Diagonalizing a quadratic Hamiltonian
Let's start with a quadratic Hamiltonian
$ H = i sum_(j, k=1)^(2n) A_(j k) a_j a_k, $ <eq:hamiltonian>
where $A$ is real and antisymmetric to make $H$ Hermitian.
Real antisymmetric matrices can be put into a near-diagonal form by a real orthogonal transformation. To be precise,
$
A = R^T Lambda R = R^T mat(
  0, lambda_1, 0, 0, dots, 0, 0;
-lambda_1, 0, 0, 0, dots, 0, 0;
0, 0, 0, lambda_2, dots, 0, 0;
0, 0, -lambda_2, 0, dots, 0, 0;
dots.v, dots.v, dots.v, dots.v, dots.down, dots.v, dots.v;
0, 0, 0, 0, dots, 0, lambda_n;
0, 0, 0, 0, dots, -lambda_n, 0;
) R
$ <eq:diagonalize>
#jinguo([This is similar to Lanczos tridiagonalization?])
for real positive-definite $lambda_k$. The nonzero eigenvalues of this matrix are $plus.minus lambda_k$. In the odd-dimensional case $Sigma$ always has at least one row and column of zeros.

More generally, every complex skew-symmetric matrix can be written in the form $A = U Sigma U^T$ where $U$ is unitary and $Sigma$ is block diagonal with $lambda_k$ still real positive-definite. This is an example of the Youla decomposition of a complex square matrix.


Using this decomposition, we can define new Majorana operators $b_i = sum_j R_(i j) a_j$. Using the fact that $R$ is orthogonal, you can prove that these $b_i$ are Majorana operators as well. In terms of these new operators, our Hamiltonian becomes very simple:
$
H = i sum_n lambda_n (b_(2 n) b_(2 n+1) - b_(2 n+1) b_(2 n)) = 2 i sum_n lambda_n b_(2 n) b_(2 n+1)
$ <eq:hamiltonian2>
We've thus taken a Hamiltonian that consisted of $2n$ coupled Majorana operators, and transformed it into a Hamiltonian that consists of $n$ decoupled systems, each with two Majorana operators.

We can then transform it back into a Fermion Hamiltonain by writing $c_n = 1/2 (b_(2 n) + i b_(2 n+1))$ and noting that $i b_(2 n) b_(2 n+1) = 2 c^dagger_n c_n + text("constant")$. Thus,
$
H = sum_n 4 lambda_n c^†_n c_n + text("constant")
$

Note that if you want to calculate the ground state expectation value of products of $a$ operators, it's not so bad. You can write your $a$ operators out in terms of the $a_i$ operators, and you can figure out how the $a_i$ act on the ground state.

To read more about solving Majorana Hamiltonians, see here: https://arxiv.org/abs/cond-mat/0010440


= Time evolution

#theorem([
  Let $H$ be a quadratic Hamiltonian as in @eq:hamiltonian, then there exists a $tilde(R) in S O(2n)$, such that
  $e^(-i H) a_k e^(i H) = sum_j tilde(R)_(k j) a_j$, e.g. time evolution of a quadratic Hamiltonian is a linear transformation of Majorana operators.
])

The time evolution of the Hamiltonian is
$
e^(-i H) = e^(bold(a)^T A bold(a)) = e^(bold(a)^T R^T Lambda R bold(a))
$

By using @eq:hamiltonian2 and @eq:commute, we have
$
e^(-i H) = product_(i=1)^n e^(2lambda_i b_(2 i) b_(2 i+1))
$

Since we have
$
a_i = sum_(j=1)^(2n) R^T_(i j) b_j 
$

The evolution of operator $a_(k)$ is
$
e^(-i H) a_k e^(i H) &= product_(i=1)^n e^(2lambda_i b_(2 i) b_(2 i+1)) sum_(j=1)^n (R^T_(i 2j) b_(2 j) + R^T_(i 2j+1) b_(2j+1)) product_(i'=1)^n e^(-2lambda_i' b_(2 i') b_(2 i'+1))\
&= sum_(j=1)^n e^(2lambda_j b_(2 j) b_(2 j+1)) (R_(k 2j)^T b_(2 j) + R_(k 2j+1)^T b_(2j+1)) e^(-2lambda_j b_(2 j) b_(2 j+1))
$

// Using the formula
// $
// e^A B e^(-A) = B + [A, B] + 1/2! [A, [A, B]] + 1/3! [A, [A, [A, B]]] + dots
// $

// We have
// $
// e^(2lambda_j b_(2 j) b_(2 j+1)) b_(2 j) e^(-2lambda_j b_(2 j) b_(2 j+1)) = b_(2 j) + 2 lambda_j [b_(2j) b_(2 j+1), b_(2 j)] = b_(2 j) - 4 lambda_j b_(2 j+1)
// $

Let $b_(2j) = product_(i=1)^(j-1) Z_i X_j$ and $b_(2j+1) = product_(i=1)^(j-1) Z_i Y_j$, then we have $b_(2 j) b_(2 j+1) = i Z_j$, and
$
e^(2lambda_j b_(2 j) b_(2 j+1)) b_(2 j) e^(-2lambda_j b_(2 j) b_(2 j+1)) &= e^(2lambda_j i Z_j) X_j e^(-2lambda_j i Z_j)product_(i=1)^(j-1) Z_i \
&= (cos 4 lambda_j X_j - sin 4 lambda_j Y_j) product_(i=1)^(j-1) Z_i\
&= (cos 4 lambda_j b_(2j) - sin 4 lambda_j b_(2j+1))
$

Similarly, we have
$
e^(2lambda_j b_(2 j) b_(2 j+1)) b_(2 j+1) e^(-2lambda_j b_(2 j) b_(2 j+1)) = (cos 4 lambda_j b_(2j+1) + sin 4 lambda_j b_(2j))
$

Therefore, we have
$
e^(-i H) a_k e^(i H) &= sum_(j=1)^n (R_(k 2j)^T (cos 4 lambda_j b_(2j) - sin 4 lambda_j b_(2j+1)) + R_(k 2j+1)^T (cos 4 lambda_j b_(2j+1) + sin 4 lambda_j b_(2j)))\
&= sum_(j=1)^n mat(R_(k 2j)^T, R_(k 2j+1)^T) mat(cos 4 lambda_j, -sin 4 lambda_j; sin 4 lambda_j, cos 4 lambda_j) vec(b_(2j), b_(2j+1))\
&= sum_(j=1)^(2n) tilde(R)_(k j) a_j
$
where $tilde(R) = R^T R_lambda  R$, $ R_lambda = mat(cos 4 lambda_1, -sin 4 lambda_1, 0, 0, dots, 0, 0; sin 4 lambda_1, cos 4 lambda_1, 0, 0, dots, 0, 0; 0, 0, cos 4 lambda_2, -sin 4 lambda_2, dots, 0, 0; 0, 0, sin 4 lambda_2, cos 4 lambda_2, dots, 0, 0; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v, dots.v; 0, 0, 0, 0, dots, cos 4 lambda_n, -sin 4 lambda_n; 0, 0, 0, 0, dots, sin 4 lambda_n, cos 4 lambda_n). $

// $
// e^(-i H t) &= product_(i=1)^n exp(lambda_i (X_i Y_i - Y_i X_i))\
// &= product_(i=1)^n exp(2lambda_i i Z_i)
// $

= Match gate

A match gate has the following form:
$
M &= mat(
  cos(theta) e^(i (phi_1 - phi_2)), 0, 0, -sin(theta) e^(i psi);
  0, cos(theta') e^(i (phi_1+phi_2)), -sin(theta') e^(i psi'), 0;
  0, sin(theta') e^(-i psi'), cos(theta') e^(-i (phi_1 + phi_2)), 0;
  sin(theta) e^(-i psi), 0, 0, cos(theta) e^(-i (phi_1 - phi_2));
)\
&=mat(e^(phi_1 - phi_2), 0, 0, 0;
  0, e^(phi_1+phi_2), 0, 0;
  0, 0, e^(-phi_1 - phi_2), 0;
  0, 0, 0, e^(-phi_1 + phi_2)) mat(
  a, 0, 0, sqrt(1-a^2) e^(i phi);
  0, b, sqrt(1-b^2) e^(i phi), 0;
  0, -sqrt(1-b^2)e^(-i phi'), b, 0;
  -sqrt(1-a^2)e^(-i phi), 0, 0, a)
  $

= References
- https://physics.stackexchange.com/questions/383659/is-a-quadratic-majorana-hamiltonian-exactly-solvable