---
title: Data and Its Applications (CS4.301)
subtitle: |
              | Monsoon 2021, IIIT Hyderabad
              | 30 August, Monday (Lecture 4)
author: Taught by Prof. Kamal Karlapalem
---

# Entity-Relationship (ER) Data Model
## Relationships
*Relationships* relate distinct entities of one entity type to distinct entities of another entity type. Relationships of the same type are grouped into *relationship types*.  

The *degree* of a relationship is the number of participating entities.  

If the same entity type participates in a relationship in two places, it must have *roles*. A relationship having roles is called a *recursive relationship type*.  

Relationships can have *constraints* on them:

* a cardinality constraint (for binary relationships), stating how many entities a certain number of entities can be related to.
* a participational constraint, which can be either total (every entity must be related) or partial (some entities must be related).
