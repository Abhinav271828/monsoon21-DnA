---
title: Data and Its Applications (CS4.301)
subtitle: |
              | Monsoon 2021, IIIT Hyderabad
              | 30 September, Thursday (Lecture 12)
author: Taught by Prof. Kamal Karlapalem
---

# Relational Data Model (contd.)
## SQL (A Relational Database Language)
### Retrieval
SQL's basic statement for retrieving information from a database is the `SELECT`{.sql} statement. This is *not* the same as the $\sigma$ operation of the relational algebra.  
Note that it allows tuples to be identical; SQL relations are multisets or bags, but not sets.  

The basic form of a query is
```sql
SELECT <attrlist>
FROM <tablelist>
WHERE <cond>
```

#### Set Operations  
The union of two relations can be taken as
```sql
<REL1>
UNION
<REL2>
```
The relations may themselves be queries.

#### Conditions  
The conditions may involve nested queries, especially with the `IN`{.sql} (membership) or `EXISTS`{.sql} (emptiness) conditions.  

Note that to compare with `NULL`{.sql}, we need to use `IS`{.sql}  and `IS NOT`{.sql}, rather than equality.  

The `LIKE`{.sql} condition can be used to test membership in a set determined by a regex-like definition.

#### Aggregate Functions and Grouping  
The corresponding aggregate functions on attributes can be given in the `<attrlist>` part of the `SELECT{.sql}` clause. We can also add `GROUP BY`{.sql} clause to indicate which attributes to group by.  

Groups can be constrained by a `HAVING`{.sql} clause.  

The order of the tuples can be determined by the `ORDER BY`{.sql} clause.

### Data Manipulation
#### Insertion  
The following syntax can be used to insert tuples into relations:
```sql
INSERT INTO <tablename> (attr1, attr2, ..., attrn)
VALUES (val1, val2, ..., valn)
```

Multiple tuples can be inserted in a relation by substituting the `VALUES`{.sql} clause with an SQL query.  

#### Deletion  
Similarly,
```sql
DELETE FROM <tablename>
WHERE <cond>
```
deletes all the tuples that satisfy `cond`.

#### Updation  
Updates are specified using the `UPDATE`{.sql} clause.
```sql
UPDATE <tablename>
SET <attr> = <val>
WHERE <cond>
```

### Views
A view is a virtual table, which can be created using a retrieval query.
```sql
CREATE VIEW <viewname> (attr1, attr2, ..., attrn)
AS (SELECT ...)
```
If the attribute names are unspecified, they are inherited from the corresponding relations.  

Views can be queried like ordinary relations. However, they are not realised at the time of definition, but re-created from the source relation(s) every time they are queried.
