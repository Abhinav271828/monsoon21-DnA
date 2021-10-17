---
title: Fundamentals of Database Systems
subtitle: Chapter 8: The Relational Algebra and Relational Calculus
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 8.1 Unary Relational Operations: SELECT and PROJECT
## 8.1.1 The SELECT Operation
This operation chooses a subset of tuples from a relation that satisfies a certain condition, like a filter. For example, $\sigma_\text{Dno = 4}(\text{EMPLOYEE})$, or in general, $\sigma_\text{condition}(R)$.  
The attributes of the resulting relation are the same as those of the input.

The condition is a Boolean expression on the attributes.  
The fraction of tuples selected by a condition is called its *selectivity*.

The SELECT operation is commutative and can be cascaded.  

$\sigma_c(R)$ is equivalent to the SQL statement
```sql
SELECT *
FROM R
WHERE c
```

## 8.1.2 The PROJECT Operation
This operation selects certain columns from a relation and discards the rest. It is denoted $\pi_\text{attribute list}(R)$. The degree of the result is equal to the cardinality of the attribute list.  

Duplicate tuples are removed, in the case where the attribute list includes only non-key attributes of $R$.  

$\pi_l (R)$ is equivalent to the SQL statement
```sql
SELECT DISTINCT l
FROM R
```

## 8.1.3 Sequences of Operations and the RENAME Operation
This operation allows us to name intermediate relations so as to avoid long sequences of operations. For example,  
$\text{DEP5_EMPS} \gets \sigma_\text{Dno=5}(\text{EMPLOYEE})$  
$\text{RESULT} \gets \pi_\text{Fname, Lname, Salary}(\text{DEP5_EMPS})$  

We can also rename the attributes of the relations using this:  
$\text{TEMP} \gets \sigma_\text{Dno=5}(\text{EMPLOYEE})$  
$R(\text{First_name, Last_name, Salar}) \gets \pi_\text{Fname, Lname, Salary}(\text{TEMP})$  

Formally, it is denoted $\rho_{S(B_1, \dots, B_n)}(R)$, or $\rho_S(R)$, or $\rho_{(B_1, \dots, B_n)}(R)$. The most general way to write this in SQL is
```sql
SELECT A1 AS B1, ..., An AS Bn
FROM R as S
```

# 8.2 Relational Algebra Operations from Set Theory
## 8.2.1 The UNION, INTERSECTION, and MINUS Operations
When these operations are applied to pairs of relations, the tuples in the two relations must be of the same type; this is called *union* or *type* compatibility (if they have the same degree and the same attribute domains).  

Conventially, the result has the same attribute names as the first relation.

UNION and INTERSECTION are both commutative and associative, and can therefore be generalised to act on any number of relations.

## 8.2.2 The CARTESIAN PRODUCT (CROSS PRODUCT) Operation
This operation is denoted by $\times$. There is no condition of compatibility; its operation is of the form $R(A_1, \dots, A_n) \times S(B_1, \dots, B_m) \to Q(A_1, \dots, A_n, B_1, \dots, B_m). The cardinality of the result is the product of the cardinalities of the operands, and its degree is the sum of degrees of the operands.  

The $n$-ary CARTESIAN PRODUCT is a natural generalisation of this.  

In SQL, this operation is equivalent to the `CROSS JOIN`{.sql} statement.

# 8.3 Binary Relational Operations: JOIN and DIVISION
## 8.3.1 The JOIN Operation
This operation is denoted by $\bowtie$ and is used to combine related tuples from two relations. The JOIN operation can be expressed in terms of other operations as $R \bowtie_c S = \sigma_c (R \times S)$. The condition $c$ involves attributes of both $R$ and $S$.

## 8.3.2 Variations of JOIN: The EQUIJOIN and NATURAL JOIN
A JOIN operation where the only comparison operator is $=$ is called an EQUIJOIN.  

In the case of EQUIJOINs, two attributes in the result always have the same values. NATURAL JOIN removes the second of these columns, if they have the same name in both relations. It is denoted by $ * $.A  

The size of the JOIN result $R \bowtie_c S$ divided by the size of $R \times S$ is called the *join selectivity*.  

JOIN operations are *inner joins*; they produce one table from the information contained in 2 tables. These are defined as a combination of CARTESIAN PRODUCT and SELECTION.

## 8.3.3 A Complete Set of Relational Algebra Operations
The set $\{\sigma, \pi, \cup, \rho, -, \times\} is a *complete* set. Other operations are included for convenience.

## 8.3.4 The DIVISION Operation
This operation is denoted by $\div$. Formally, $R(Z) \div S(X)$, where $X \subseteq Z$, is the set $Q(Z - X)$ of all tuples $t$ such that there are $t_R$ in $R$ such that $t_R[Z-X] = t$ and $t_R[X] = t_S$ for all $t_S \in S$.  

It can be described using the basic operations as  
$Q_1 \gets \pi_Y(R)$  
$Q_2 \gets \pi_Y((S \times T_1) - R)$  
$Q \gets T_1 - T_2$  

## 8.3.5 Notation for Query Trees
A query tree is a data structure that corresponds to a relational algebra expression. The inputs are leaf nodes and the relational algebra operations are internal nodes.

# 8.4 Additional Relational Operations
## 8.4.1 Generalised Projection
This allows functions of attribute values to be included in the projection list, *i.e.*, $\pi_{F_1, \dots, F_n}(R)$, where $F_i$ are functions over the attributes of $R$.

## 8.4.2 Aggregate Functions and Grouping
We can also specify aggregate functions on collections of values from the database, commonly SUM, AVERAGE, MAXIMUM, MINIMUM, and COUNT.  

We might also want to apply the aggregate function to groups of tuples rather than the whole relation. This is denoted as $_ \text{grouping attributes} \mathfrak{F} _ \text{function list} (R)$. The result has the grouping attributes plus one attribute for each function.

## 8.4.3 Recursive Closure Operations
Recursive closures apply to relationships between tuples of the same type. For example, we might want to find all supervisees of an employee $e$, along with all those supervised by one of $e$'s supervisees, and so on.

## 8.4.4 OUTER JOIN Operations
An OUTER JOIN operation does not result in any loss of information. It behaves like an ordinary EQUIJOIN, but tuples which do not satisfy the condition are retained and a NULL value is inserted for them.  

In a LEFT OUTER JOIN, all tuples from the first operand are retained; in a RIGHT OUTER JOIN, those from the second one are retained. We also have a FULL OUTER JOIN, which keeps all the tuples.

## 8.4.5 The OUTER UNION Operation
This operation carries out a kind of UNION between relations that are not type compatible. For example, it can be carried out between $R(X,Y)$ and $S(X,Z)$, resulting in $T(X,Y,Z)$. It is the same as performing a FULL OUTER JOIN on $X$.

# 8.5 Examples of Queries in Relational Algebra

# 8.6 The Tuple Relational Calculus
We write a declarative expression to specify a rerieval; the relational calculus is thus a non-procedural language. The expressive power, however, is identical to that of the relational algebra.

## 8.6.1 Tuple Variables and Range Relations
The calculus is based on specifying a number of tuple variables. Each tuple ranges over a particular relation, e.g. `{t | COND(t)}`.  
All tuples satisfying `COND` are then included. A condition can specify the range relation of a variable, as in `{t | EMPLOYEE(t) AND t.Salary > 50000}`.

## 8.6.2 Expressions and Formulas in Tuple Relational Calculus
A general expression has the form `{t1.Aj, t2.Ak, ..., tn.Am | COND(t1,t2,...,tn,...,tp)}`.  

`COND` is either a condition specifying the range, or a copmarison-based condition.

## 8.6.3 The Existential and Universal Quantifiers
These quantifiers can be used in conditional formulae.

## 8.6.4 Sample Queries in Tuple Relational Calculus

## 8.6.5 Notation for Query Graphs

## 8.6.6 Transforming the Universal and Existential Quantifiers

## 8.6.7 Using the Universal Quantifier in Queries

## 8.6.8 Safe Expressions
