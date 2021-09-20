---
title: Fundamentals of Database Systems
subtitle: Chapter 5: The Relational Data Model and Relational Database Constraints
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 5.1 Relational Model Concepts
The relational model represents the DB as a collection of relations, each of which resembles a *flat file* of records (where each record has a simple linear or flat structure).  

A relation can be thought of as a *table* of values, each row of which represents a collection of related values.

## 5.1.1 Domains, Attributes, Tuples, and Relations
A *domain* is a set of atomic values. *Atomic* values are those values which are indivisible w.r.t the relational model.  

The logical definitions of domains describe their contents informally ( like `Indian_phone_numbers`). Each domain also has a *datatype* or *format*, (like `dddddddddd`).  

A *relational schema* or *scheme* $R(A_1, \dots, A_n)$ is made up of a relation name $R$ and a list of attributes $A_i$. Each *attribute* $A_i$ is a role played by some domain $D_i$ in the schema $R$. $D_i$ is called the *domain* of $A_i$, denoted by $\text{dom}(A_i)$. $R$ is the *name* of the relation described by the schema. $n$ is called the *degree* or *arity* of the schema.  

A *relation* or a *relation state* of the relational schema $R(A_1, \dots, A_n)$ is a set of $n$-tuples $r = \{t_1, \dots, t_m\}, t_i = \langle v_1, \dots, v_n \rangle$. Each value $v_i$ belongs to $\text{dom}(A_i)$.  

It is common to call the schema $R$ the *relation intension* and its state $r(R)$ the *relation extension*.  

Mathematically, $r(R) \subseteq \text{dom}(A_1) \times \cdot \times \text{dom}(A_n)$.

## 5.1.2 Characteristics of Relations
* Ordering of tuples in a relation: In a file, the records have some order; however, in the relation it represents, there is no notion of ordering of tuples.
* Ordering of values within a tuple and an alternative definition of a relation: the ordering of values is not important as long as the correspondence between attributes and values is maintained. An alternative definition of a relation characterises tuples as mappings $t_i : R \to \bigcup_{1 \leq j \leq n} \text{dom}(A_j)$ such that $t_(A_j) \in \text{dom}(A_j)$. This is equivalent to defining $t_i$ as a set of pairs $\langle A_j, v_j \rangle$, where $v_j \in \text{dom}(A_j)$. This kind of data is called *self-describing data*.
* Values and NULLs in the tuples: Each value in a tuple is atomic (this is called the *flat relational model*). This assumption is called the *first normal form* assumption. The NULL value is used to represent the values of attributes that are unknown for or inapplicable to a tuple.  
* Interpretation (meaning) of a relation: The schema can be interpreted as a declaration or a tuple of assertion. Each tuple is a fact or an instance of the assertion. Alternatively, a relation schema can be a predicate, and the tuples the values that satisfy the predicate. By the *closed world assumption*, only true facts are present in the extension of the relation.

## 5.1.3 Relational Model Notation

# 5.2 Relational Model Constraints and Relational Database Schemas
Constraints on DBs can be *inherent model-based constraints* (or *implicit constraints*), *schema-based constraints* (or *explicit constraints*), or *application-based constraints* (or *semantic constraints* or *business rules*).  

*Data dependencies* (which include *functional dependencies* and *multivalued dependencies*) form another category of constraints.

## 5.2.1 Domain Constraints
Domain constraints specify that $t(A_i) \in \text{dom}(A_i)$ for all tuples $t$.

## 5.2.2 Key Constraints and Constraints on NULL Values
Usually, there are subsets of attribues of a relation schema $R$ which have different combinations of values for all tuples. Such a set is called a *superkey* of the schema, which specifies a uniqueness constraint on the relation.  

A *key* $k$ of $R$ is a minimal superkey. The set of attributes constituting a key is a time-invariant property of a relation.  

All the keys of a given a relation schema are called its *candidate keys*, and one of them is designated as a *primary key* (making the rest *unique keys*).

## 5.2.3 Relational Databases and Relational Database Schemas
A relational database schema $S$ is a set of relation schemas $\{R_1, \dots, R_m\}$ and a set of integrity constraints IC. A *relational database state* (or *snapshot*) DB is a set of relation states $\{r_1, \dots, r_m\}$ for each relation schema $R_i \in S$. A state may be valid or invalid depending on whether or not it satisfies all constraints in IC.

## 5.2.4 Entity Integrity, Referential Integrity, and Foreign Keys
The *entity integrity constraint* states that no primary key value can be NULL.  

The *referential integrity constraint* is specified between two relations. It states that a tuple in one relation that refers to one in another relation must refer to an existing tuple in that relation. More formally, let us define a *foreign key* FK of a relation $R_1$ that references relation $R_2$ if $\text{dom}(\text{FK}) = \text{dom}(\text{PK})$ [where PK is the primary key of $R_2$] and all values of FK either occur in $R_2$ or are null.  
FK is said to *reference* $R_2$, and if $t_1 \in R_1$'s FK value is the same as $t_2 \in R_2$'s PK value, then $t_1$ is said to *reference* $t_2$.

## 5.2.5 Other Types of Constraints
Constraints that are not part of the DDL have to be specified and enforced in a different way (within the application programs or using a *constraint specification language*). Mechanisms called *triggers* and *assertions* can be used in SQL.  

Such constraints can be *state constraints* or *transition constraints*.

# 5.3 Update Operations, Transactions, and Dealing with Constraint Violations
The relational model's operations can be *retrievals* (specified by the operations of relational algebra) or *updates*.

## 5.3.1 The Insert Operation
This operation provides a list of attribute values for a new tuple that is to be inserted into a relation.  

Key constraints (if the key attribute's value is already taken by some tuple), entity integrity (if any part of the PK is NULL) or referential integrity (if the value referenced by the FK does not exist) can be violated.

## 5.3.2 The Delete Operation
This operation removes a tuple from a relation.  

It can violate only referential integrity (if the key being deleted is referenced by FKs in other tuples). In this case it can be *rejected*, *cascaded*, or *set NULL* (or *set default*).

## 5.3.3 The Update Operation
This operation is used to change one or more attributes' values in one or more tuples in a relation. A condition to select the tuple(s) must be specified.  

Updating an attribute which is in neither a PK nor an FK causes no problems. In other cases, the issues of both insertion and deletion are relevant.

## 5.3.4 The Transaction Concept
A *transaction* is an executing program that includes some DB operations. They are executed by DB application programs accessing a relational DB.  

Transactions must leave the DB in a valid state after executing. They form an atomic unit of work on the DB.

# 5.4 Summary
