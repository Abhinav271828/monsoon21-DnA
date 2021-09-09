---
title: Data and Its Applications (CS4.301)
subtitle: |
              | Monsoon 2021, IIIT Hyderabad
              | 09 September, Thursday (Lecture 6)
author: Taught by Prof. Kamal Karlapalem
---

# Entity-Relationship (ER) Data Model
## $n$-ary Relationship Types (contd.)
When an $n$-ary relationship has to be converted to $n$ binary relations, the relationship is represented as a weak entity with $n$ identifying entity types.  

For example, if $(a, b, c)$ is an instance of a ternary relationship $T$, then $(s, a) \in B_1, (s, b) \in B_2, (s, c) \in B_3$, where $B_i$ are the binary relationships that model $T$.  

## Enhanced ER Model
### Specialisation
Specialisation is a property of enhanced ER models that supports *is-a* relationships. An entity type can be divided into disjoint ($d$) or overlapping ($o$) classes.  

Further, the entity type may have *partial* or *total* participation in the division into subclasses.

### Generalisation
Generalisation allows us to suppress the differences of different entity types, identify their common attributes, and generalise them to a superclass. It is in a way the inverse of specialisation.

### Aggregation
Aggregation is a form of abstraction, for building composite objects from their components. It supports the *is-part-of* relationship.

# Relational Data Model
The relational data model is a bottom-up approach to a database.  

A relation is a collection of tuples, which are ordered sets of values. A tuple $t$ of $R(A_1, A_2, \dots, A_n)$ is an ordered set $\langle v_1, v_2, \dots, v_n \rangle$, where $v_i \in \text{dom}(A_i)$.  

Relations are represented in a tabular form, where each column represents an entity type and a row represents a tuple. All values in a tuple are considered atomic.
