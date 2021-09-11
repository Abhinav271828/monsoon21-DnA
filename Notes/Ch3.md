---
title: Fundamentals of Database Systems
subtitle: Chapter 3: Data Modelling Using the Entity-Relationship (ER) Model
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 3.1 Using High-Level Conceptual Data Models for Database Design
The first step towards designing a database is *requirements collection and analysis*, in which the *data requirements* and *functional requirements* are understood and documented.  
Then, a *conceptual schema* for the database is created, using a high-level conceptual data model (this does not include implementation details).  
Next, the schema is implemented using a commercial DBMS – this is called *logical design* or *data model mapping*.  
Lastly, in the *physical design* phase, the internal storage structures, organisations, access paths, etc. are specified.  

# 3.2 A Sample Database Application

# 3.3 Entity Types, Entity Sets, Attributes, and Keys
## 3.3.1 Entities and Attributes
An *entity* is a thing or an object in the real world with independent existence (physical or conceptual). Each entity has *attributes*, or properties that describe it. There are several types of attributes:

* composite versus simple or atomic attributes
* single-valued versus multivalued attributes
* stored versus derived attributes
* NULL values
* complex attributes

## 3.3.2 Entity Types, Entity Sets, Keys, and Value Sets
An *entity type* defines a collection of entities that have the same attributes. The collection of all entities of a particular type in the DB at any point is called an *entity set*.  
An *entity* type describes the *schema* or *intension* for a set of entities that have the same structure; the entity set is called the *extension* of the entity type.  

A *key attribute* is one whose values are distinct for each entity in the entity set. If a set of attributes is such, they are to be grouped into a composite attribute and designated as a key attribute.  
This is a constraint on all entity sets in the DB, and not just any single one.  

The *value set* or *domain* of an attribute is the set of values that may be assigned to it for each individual entity.  

Mathematically, an attribute $A$ of an entity set $E$ whose value set if $V$ can be defined as a function $A : E \to P(V)$. The valu e of attribute $A$ for entity $e$ is denoted $A(e)$.  
For single-valued attributes, the range of the function is restricted to singleton sets. The value set of a composite attribute is derived from those of its component attributes using the Cartesian product operation.

## 3.3.3 Initial Conceptual Design of the COMPANY Database

# 3.4 Relationship Types, Relationship Sets, Roles and Structural Constraints
## 3.4.1 Relationship Types, Sets and Instances
A *relationship type* among $n$ entity types defines a set of associations among entities from these types. This *relationship set* consists of *relationship instances*, which each associate $n$ entities among each other.

## 3.4.2 Relationship Degree, Role Names, and Recursive Relationships
The *degree* of a relationship type is the number of participating entity types.  

Relationships can be represented as attributes as well.  

Each participating entity type has a *role name*, describing its role in the relationship. In case of relationships which have the same entity type participating in different roles (called *recursive* or *self-referencing* relationships), role names are essential.

## 3.4.3 Constraints on Binary Relationship Types
*Cardinality ratios* specify the maximum number of relationship instances that an entity can participate in for a given relationship type. Usually, $N$ is understood to mean any number (0 or more, with no maximum).  

The *participation constraint* specifies whether an entity must be related to another or not, and the minimum number of relationship instances it must participate in. Entity types can have *total* or *partial* participation in a relationship type.

## 3.4.4 Attributes of Relationship Types
Attributes of relationship types are similar to those of entity types.  

In the case of 1:1 or 1:$N$ relationship types, they can be assigned to one of the participating entity types.

# 3.5 Weak Entity Types
*Weak entity types* are those that do not have key attributes of their own. They are identified by being related to another entity type (called the *identifying* or *owner* type) by the *identifying relationship*.  

A weak entity type has a *partial key*, which can uniquely identify weak entities related to the same owner entity.  

Weak entity types may be represented as complex attributes of their owner entity types.

# 3.6 Refining the ER Design for the Company Database

# 3.7 ER Diagrams, Naming Conventions, and Design Issues
## 3.7.1 Summary of Notation for ER Diagrams

## 3.7.2 Proper Naming of Schema Constructs

## 3.7.3 Design Choices for ER Conceptual Design

## 3.7.4 Alternative Notations for ER Diagrams

# 3.8 Example of Other Notation: UML Class Diagrams

# 3.9 Relationship Types of Degree Higher than Two
## 3.9.1 Choosing between Binary and Ternary (or Higher-Degree) Relationships

## 3.9.2 Constraints on Ternary (or Higher-Degree) Relationships

# 3.10 Another Example: A UNIVERSITY Database

# 3.11 Summary
