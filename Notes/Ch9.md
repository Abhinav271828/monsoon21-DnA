---
title: Fundamentals of Database Systems
subtitle: Chapter 9: Relational Database Design by ER- and EER-to-Relational Mapping
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 9.1 Relational Database Design Using ER-to-Relational Mapping
## 9.1.1 ER-to-Relational Mapping Algorithm
### Step 1: Mapping of Regular Entity Types
For each regular entity type $E$, create a relation $R$ that includes all the simple attributes of $E$. For a composite attribute, include only the simple component attributes.  

Choose one of $E$'s key attributes as $R$'s primary key. If $E$'s key is composite, then all the simple attributes in it form the key.  
The knowledge of $E$'s other keys is kept for indexing purposes.  

Such relations are called *entity relations*.

### Step 2: Mapping of Weak Entity Types
For each weak entity type $W$, create a relation $R$ and include all simple attributes and simple components of composite attributes. In addition, include as foreign key attributes of $R$ the primary key attributes of the owner type relation.  

The primary key of $R$ is the combination of the primary key of the owner type and the partial key of $W$.

### Step 3: Mapping of Binary 1:1 Relationship Types
For each such relationship type $R$, identify the relations $S$ and $T$ corresponding to the participating entity types. There are three approaches.

#### Foreign Key Approach
Include the primary key of $T$ as a foreign key in $S$. The role of $S$ should be an entity with total participation in $R$.  
Include all the simple attributes and simple components of composite attributes as attributes $S$.

#### Merged Relation Approach
Both the entity types can be merged into a single relation (this is possible when both the participations are total).

#### Cross-Reference or Relationship Relation Approach
A third relation $R$ is set up to cross-reference the primary keys of the two relations $S$ and $T$ of the participating entity types. This approach is necessary for binary M:N relations.  
$R$ is called a *relationship relation* or *lookup table*.

### Step 4: Mapping of Binary 1:N Relationship Types
There are two approaches.

#### Foreign Key Approach
Let $S$ be the relation for the participating entity type at the $N$-side. Include as a foreign key in $S$ the primary key of the relation $T$.

#### Relationship Relation Approach
As for 1:1 relationships, create a new relation that has as its attributes the primary keys of $S$ and $T$. $R$'s primary key is the same as $S$'s.

### Step 5: Mapping of Binary M:N Relationship Types
When there are no multivalued attributes, the only option is the relationship relation approach. As before, a new relation with the primary keys of the participating types as attributes must be created, but the primary key is now the combination of both these.

### Step 6: Mapping of Multivalued Attributes
For each multivalued attribute $A$, create a new relation $R$, with an attribute corresponding to $A$ plus the primary key of the entity whose attribute $A$ is.

### Step 7: Mapping of $N$-ary Relationship Types
For this too, we use the relationship relation option, including a new relationship relation for each $n$-ary attribute ($n > 2$). Include as foriegn key attributes the primary keys of the relations that represent the participating entity types.  
The primary key of $S$ should include all the foreign keys except those of entity types with cardinality constraint 1.

## 9.1.2 Discussion and Summary of Mapping for ER Model Constructs

# 9.2 Mapping EER Model Constructs to Relations
## 9.2.1 Mapping of Specialisation or Generalisation
The two main options are to map the whole specialisation into a single table, or to map it into multiple tables.

### Step 8: Options for Mapping Specialisation or Generalisation
Convert each specialisation with $m$ subclasses $\{S_1, \dots, S_m\}$ and superclass $C$ with attributes $\{k, a_1, \dots, a_n\}$ into relation schemas with one of the following options.

#### Option 8A: Multiple Relations (Superclass and Subclasses)
Create a relation $L$ for $C$ with attributes $\{k, a_1, \dots, a_n\}$ and primary key $k$, and a relation $L_i$ for each $S_i$, with the attributes $\{k\} \cup \{\text{Attrs}(S_i)\}$ and primary key $k$.  
This works for any specialisation.

#### Option 8B: Multiple Relations (Subclass Relations Only)
Create a relation $L_i$ for each $S_i$ with the attributes $\{\text{Attrs}(S_i)\} \cup \{k, a_1, \dots, a_n\}$ and primary key $k$.  
This works for any specialisation with total subclasses, and is only recommended when the subclasses are disjoint.

#### Option 8C: Single Relation with One Type Attribute
Create a relation $L$ with attributes $\{k, a_1, \dots, a_n\} \cup \bigcup_{i = 1}^m \text{Attrs}(S_i) \cup \{t\}$, and primary key $k$.  
$t$ is called a *type* or *discriminating* attribute which indicates the subclass to which a tuple belongs.  
This only works for disjoint subclasses.

#### Option 8D: Single Relation with Multiple Type Attributes
Create a relation $L$ with attributes $\{k, a_1, \dots, a_n\} \cup \bigcup_{i = 1}^m \text{Attrs}(S_i) \cup \{t_1, \dots, t_m\}$, and primary key $k$.  
Each $t_i$ is a Boolean type attribute indicating whether or not a tuple belongs to $S_i$.  
This works for overlapping subclasses as well.

## 9.2.2 Mapping of Shared Subclasses (Multiple Inheritance)
Any of the above options can be applied.

## 9.2.3 Mapping of Categories (Union Types)
-

# 9.3 Summary
