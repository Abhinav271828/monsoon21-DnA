---
title: Data and Its Applications (CS4.301)
subtitle: |
              | Monsoon 2021, IIIT Hyderabad
              | 27 September, Monday (Lecture 11)
author: Taught by Prof. Kamal Karlapalem
---

# Relational Data Model
## Closures (contd.)
A set $F$ of FDs is redundant if it includes some $X \to Y$ such that $F^+ = (F - \{X \to Y\})^+$, *i.e.*, such that removing it does not reduce the closure of $F$. Otherwise, it is nonredundant.  

Functional dependencies are said to be in canonical form if they are of the form $X \to Y$, where $Y$ is a single attribute and $\nexists A \mid X - A \to Y$ ($X$ is minimal). A set $F$ of FDs is in canonical form if all $F' \in F$ are of the form $X \to Y$, where $Y$ is a single attribute, $\nexists A \mid X - A \to Y$ ($X$ is minimal) and $(F - F')^+ \neq F^+$.  

## Decompositions
When a relation $R$ is decomposed into some relations $R_i$, these relations have some properties:

* all attributes of $R$ occur in some $R_i$
* (dependency preservation property) each FD associated with $R$ appears in, or is derivable from, the FDs of one or more $R_i$. Formally,
    $$\left( \bigcup_{i} \pi_{R_i}(F) \right)^+ = F^+.$$
* (lossless join property) for every relation instance $r$ of $R$,
    $${\Large \bowtie}_ {i} \pi_{R_i}(r) = r.$$
    We can also say that a decomposition $R_1, R_2$ has this property if either $R_1 \cap R_2 \to R_1 - R_2$ or $R_1 \cap R_2 \to R_2 - R_1$.

## Tuple Relational Calculus
The form of an expression in the tuple relational calculus is that of a set in set-builder form: $\{L \mid R\}$, where $L$ is a set of variables and $R$ is a set of conditions on these variables. For example,
$$\{t \mid \text{Employer}(t) \wedge (t. \text{Salary} > 5000)\}$$

Conditions have various forms: $R(t_i)$ identifies $R$ as the rangle of $t_i$; $t_i.A \text{ op } t_j.B$, where op is a comparison operator; or one or more conditions joined by connectives.
