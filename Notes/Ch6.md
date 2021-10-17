---
title: Fundamentals of Database Systems
subtitle: Chapter 6: Basic SQL
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 6.1 SQL Data Definition and Data Types
SQL calls relations *tables*, tuples *rows* and attributes *columns*. The `CREATE` statement can be used for schemas, tables, types and domains, as well as views, assertions and triggers.

## 6.1.1 Schema and Catalogue Concepts in SQL
SQL schemata allow us to group together tables that belong to the same database application. An SQL schema is identified by a schema name and includes an authorisation identifier, as well as descriptors for each element (tables, types, constraints, views, domains, etc.).  

A schema is created by the `CREATE SCHEMA` statement.  

The privilege to create schemas and other constructs must be explicitly granted to the relevant user accounts by the system administrator.  

A *catalogue* is a named collection of schemas, one of which is a special one named INFORMATION_SCHEMA. Integrity constraints can only be declared within catalogues.

## 6.1.2 The CREATE TABLE Command in SQL
This command specifies a new relation with its attributes and initial constraints. Each attribute has a name, a datatype, and possibly constraints. Integrity constraints can be part of the declaration or added later.  

The schema in which it is created is either implicitly specified in the environment or explicitly attached to the table name.  

Tables created by this statement are called *base tables*, as opposed to virtual relations, which are made by the CREATE VIEW statement. The latter may or may not correspond to an actual file.  

Note that the attributes of a table are ordered, but its rows may not be.

## 6.1.3 Attribute Data Types and Domains in SQL
The basic datatypes available include numeric, character string, bitstring, Boolean, date and time.  

A domain can be declared using the `CREATE DOMAIN` statement.

# 6.2 Specifying Constraints in SQL
## 6.2.1 Specifying Attribute Constraints and Attribute Defaults
Constraints can be specified on attributes using keywords like `NOT NULL`. A `DEFAULT` clause can be added to an attribute to specify a default value.

## 6.2.2 Specifying Key and Referential Integrity Constraints
These can be given in the `CREATE TABLE` statement. Examples include `PRIMARY KEY` (one or more attributes), `UNIQUE`, `FOREIGN KEY`, etc.  

An integrity violation is handled by rejecting the operation, but a referential triggered action can also be attached to the constraint, like `SET NULL`, `CASCADE` and `SET DEFAULT`. This must be qualified by either `ON DELETE` or `ON UPDATE`.

## 6.2.3 Giving Names to Constraints

## 6.2.4 Specifying Constraints on Tuples Using `CHECK`
`CHECK` is an example of a row-based constraint as it applies to all the tuples.

# 6.3 Basic Retrieval Queries in SQL
The basic statement for retrieving information in SQL is the `SELECT` statement. Note that SQL allows tables to have two identical tuples by default.

## 6.3.1 The SELECT-FROM-WHERE Structure of Basic SQL Queries
The simplest form of the `SELECT` command is  
```sql
SELECT <attrs>
FROM <tables>
WHERE <cond>;
```
The basic logical comparison operators can be used in the condition.  

The attributes specified are called the *projection attributes*, and the `WHERE` condition is called the *selection condition*. If the condition refers to tuples from two tables, it is called a *join condition*.

## 6.3.2 Ambiguous Attributes Names, Aliasing, Renaming and Tuple Variables
Aliases are given by the `AS` keyword. If two tables have attributes with the same name, they must be qualified by the table name to avoid ambiguity.

## 6.3.3 Unspecified `WHERE` Clause and Use of the Asterisk
When there is no `WHERE` clause and multiple tables, the cross product of the tables is selected. In case we want all attributes, we use the `*` instead of listing all of them out.

## 6.3.4 Tables as Sets in SQL
The keyword `DISTINCT` can eliminate duplicate tuples in the result of `SELECT` command.  

The `UNION`, `EXCEPT` and `INTERSECT` operations can be applied to two type-compatible relations. Adding the keyword `ALL` allows us to use these operations on multisets.

## 6.3.5 Substring Pattern Matching and Arithmetic Operators
The `%` symbol is like `*` in regexes, and `_` is like `.` in regexes. Strings using these characters can be matched against normal strings using `LIKE`.  

Arithmetic operators can also be used in the attribute list.

## 6.3.6 Ordering of Query Results
Tuples can be ordered according to certain attributes using the `ORDER BY` clause.

## 6.3.7 Discussion and Summary of Basic SQL Retrieval Queries

# 6.4 `INSERT`, `DELETE` and `UPDATE` Statements in SQL
## 6.4.1 The `INSERT` Command
It is used to add a single row to a relation. The values should be listed in the same order as the corresponding attributes in the `CREATE TABLE` command, unless a new ordering is specified.  

Multiple tuples can be inserted, enclosed in brackets and separated by commas.  

The output of a `SELECT` statement can also be used in an `INSERT` command.

## 6.4.2 The `DELETE` Command
This removes tuples from a relation. It includes a `WHERE` clause.  

It may lead to referential triggered actions, but otherwise acts on only one table at a time.

## 6.4.3 The `UPDATE` Command
This command, too, may lead to referential triggered actions. It also has a `WHERE` clause, and also a `SET` clause for the new values of the tuple.

# Additional Features of SQL

# Summary
