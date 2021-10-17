---
title: Data and Its Applications (CS4.301)
subtitle: |
              | Monsoon 2021, IIIT Hyderabad
              | Assignment 3
author: |
        | George Paul (2021121006)
        | Abhijith Anil (2020101030)
        | Abhinav S Menon (2020114001)
---

# Question 1
## Question 1.1
The given set of functional dependencies is possible for all $n > 1$. For $n = 1$, the RHS of the first dependency is the null set, which is not allowed.

## Question 1.2
We assume that there are no FDs which cannot be inferred from the given dependencies.  

Each FD's LHS is a superkey (since the RHS includes all attributes except the LHS), and by assumption, has no subset which is also a superkey; therefore it is also a key. The number of FDs is given by solving the equation
$$\frac{(i-1)i}{2} + i \leq n$$
for $i$. By completing the square, we see that
$$\left(i + \frac12 \right)^2 - \frac14 = 2n.$$
Rearranging, we get
$$i = \bigg\lfloor \sqrt{2n + \frac14} - \frac12 \bigg\rfloor.$$

The keys are the LHSs of each of the dependencies.

## Question 1.3
The given relation is in BCNF, since all the relations are of the form $X \to Y$, where $X$ is a key (see question 1.2).

## Question 1.4
Since the relation is already in BCNF (see question 1.3), the given set of dependencies is itself the cover, *i.e.*, none of them can be inferred from the rest.

# Question 2
We can rewrite the given set of dependencies as
$$\begin{split}
A_1 &\to A_2 \cdots A_n \\
A_2 &\to A_1 A_3 \cdots A_n \\
&\vdots \\
A_n &\to A_1 \cdots A_{n-1}. \end{split}$$

Or equivalently,
$$A_i \to \{A_j \mid j \neq i\}, 1 \leq i \leq n$$

## Question 2.1
From above, each of the LHSs of the FDs is a singleton superkey and therefore a key. Thus $R$ has $n$ keys.

## Question 2.2
The given relation is in BCNF, since all the relations are of the form $X \to Y$, where $X$ is a key (see question 2.1).

## Question 2.3
Since the relation is already in BCNF (see question 2.2), the given set of dependencies is itself the cover, *i.e.*, none of them can be inferred from the rest.
