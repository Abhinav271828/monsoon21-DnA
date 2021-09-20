---
title: Fundamentals of Database Systems
subtitle: Chapter 4: The Enhanced Entity-Relationship (EER) Model
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 4.1 Subclasses, Superclasses and Inheritance
In many cases an entity type has a number of subcategories that need to be represented. These are called *subclasses* or *subtypes* of the entity type (which is the *superclass* or *supertype*). The relationship between a superclass and any of its subclasses is a *class/subclass* or *superclass/subclass relationship*.  
The subclasses need not be either mutually exclusive or exhaustive.  

The property of *type inheritance* allows entities of the subclass to have all the attributes of its superclass.

# 4.2 Specialisation and Generalisation
## 4.2.1 Specialisation
*Specialisation* is the process of defining a set of subclasses of an entity type.

## 4.2.2 Generalisation
This is the reverse process, wherein we suppress the differences among several entity types and generalise them into a single superclass, making them subclasses.

# 4.3 Constraints and Characteristics of Specialisation and Generalisation
## 4.3.1 Constraints on Specialisation and Generalisation
The subclasses in which membership can be determined by a condition on the value of some attribute are called *predicate-* or *condition-defined subclasses*. The condition that decides the subclass is called the *defining predicate*.  

If all subclasses in a specialisation are predicate-defined on the same attribute, the specialisation itself is called *attribute-defined*. The attribute is called the *defining attribute* or the *discriminator*.  

Other subclasses are *user-defined*, and specified individually for each entity by the user.  

Other constraints that may apply to a specialisation are:

* *disjointness*: the subclasses must be disjoint sets. All attribute-defined specialisation are disjoint. Other specialisations are *overlapping*.
* *completeness/totalness*: if the specialisation is *total*, then every entity must be a member of some subclass. Other specialisations are *partial*.

A superclass identified by generalisation is usually total.  

## 4.3.2 Specialisation and Generalisation Hierarchies and Lattices
Nested subclasses form either specialisation hierarchies or lattices.  
In a *specialisation hierarchy*, every subclass has only one parent, *i.e.*, participates as a subclass in only one class/subclass relationship.  
In a *specialisation lattice*, a subclass can be a subclass in more than one such relationship.  

A *leaf node* in a hierarchy is a class with no subclasses of its own.  

A subclass with more than one superclass is called a *shared subclass*. Such a subclass has the property of *multiple inheritance*.  

Analogously, we have *generalisation hierarchies* and *generalisation lattices*.

## 4.3.3 Utilising Specialisation and Generalisation in Refining Conceptual Schemas
Starting with a superclass and repeatedly specialising it is called *top-down conceptual refinement*. The opposite process is called *bottom-up conceptual synthesis*.
