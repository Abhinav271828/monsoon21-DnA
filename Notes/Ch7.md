---
title: Fundamentals of Database Systems
subtitle: Chapter 7: More SQL: Complex Queries, Triggers, Views and Schema Modification
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 7.1 More Complex SQL Retrieval Queries
## 7.1.1 Comparisons Involving `NULL` and Three-Valued Logic
A `NULL` has one of three interpretations – value unknown, unavailable or not applicable. SQL does not distinguish among these.  

Every `NULL` is considered different from every other. The result of a comparison involving a `NULL` is `UNKNOWN`, which is distinct from `TRUE` and `FALSE`.  
Logical operations are extended to deal with `UNKNOWN`.  

Comparisons with `NULL` are done using `IS` and `IS NOT` instead of `=` or `<>`.

## 7.1.2 Nested Queries, Tuples and Set/Multiset Comparisons
Nested queries allow us to use the resluts of a certain query as part of the comparison in the `WHERE` conditino of another.  

We can use the keywords `IN`, `ANY` (or `SOME`) and `ALL` as part of such conditions.  

As a rule, in case of ambiguities, a reference to an unqualified attribute refers to the relation declared in the innermost nested query.

## 7.1.3 Correlated Nested Queries
If a condition in a nested query references some attribute of a relation declared in the outer query, the two queries are *correlated*.

## 7.1.4 The `EXISTS` and `UNIQUE` Functions in SQL
These keywords are Boolean functions. They are applied to relations.  

`EXISTS` checks if a relation is empty or not; `UNIQUE` checks for duplicate tuples in a relation.

## 7.1.5 Explicit Sets and Renaming in SQL
An explicit set can be used with `IN`; it must be enclosed in parantheses.  

It is also possible to rename attributes that appear in the *result* of a `SELECT` query.

## 7.1.6 Joined Tables in SQL and Outer Joins
A joined table is easier to understand than an entire `SELECT` statement. The condition on which the join takes place is specified using the `ON` keyword.  
Different types of join, like NATURAL JOIN, OUTER JOIN and EQUIJOIN can be specified.

## 7.1.7 Aggregate Functions in SQL
These summarise information from multiple tuples in a single tuple. Grouping creates subgroups of tuples prior to this. Built-in aggregate functions include `COUNT`, `SUM`, `MAX`,`MIN` and `AVG`.  

Aggregate functions (except `COUNT`) usually discount `NULL` values.  

The functions `SOME` and `ALL` can be applied to collections of Boolean values.

## 7.1.8 Grouping: The `GROUP BY` and `HAVING` Clauses
`GROUP BY` partitions the table into nonoverlapping subsets or groups, on each of which the aggregate function can then be applied. A separate group is created for all tuples with a `NULL` value.  

The `HAVING` clause filters out groups with a condition. Note that `WHERE` is applied before `HAVING`.
