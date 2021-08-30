---
title: Fundamentals of Database Systems
subtitle: Chapter 2: Database System Concepts and Architecture
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 2.1 Data Models, Schemas and Instances
The DB approach provides some level of *data abstraction*, which is the suppression of details of organisation and storage, and the highlighting of essential features of the data. It allows different users to perceive data at their preferred level of detail.  

A *data model* is a collection of concepts used to describe the structure of a DB (its datatypes, relationships and constraints), and it provides the means for abstraction.  
The *dynamic aspect*, or *behaviour*, of a DB application is also sometimes specified in the data model. This allows the DB designer to specify a set of valid operations on the DB objects (distinct from the set of *basic data model operations*).  

## 2.1.1 Categories of Data Models
* *High-level* or *conceptual data models* provide concepts close to the users' perception of data
* *Low-level* or *physical data models* provide concepts that describe the details of data storage on disk.
* *Representational* or *implementation data models* provide concepts understandable by end users but corresponding to the organisation of data in computer storage. These are the most frequently used models.

Some concepts specified by data models are:

An *entity* represents a real-world concept or object.  
An *attribute* represents some property describing an entity.  
A *relationship* among two or more entities represents an association among them.  

Some representational data models are:

* the *relational data model*
* the *network* and *hierarchical data models* (legacy data models apparently?)
* the *object data model*, which is a higher-level implementation data model.

Representational data models are sometimes called *record-based data models* since they represent data using record structures.  

Physical data models present information such as record formats, record orderings and *access paths* (which are search structures that make searching efficient). An *index* is an example of an access path; it allows direct access to data using an index term or keyword.  

*Self-describing data models* represent systems which combine the description of the data with the data values themselves; for example, XML and NOSQL.

## 2.1.2 Schemas, Instances and Database State
The description of a DB is called its *schema*; it is specified during DB design and not expected to change frequently. A displayed schema is called a *schema diagram*. Each object in the schema is called a *schema construct*. The schema constructs and constraints are stored as *meta-data*.  

All the data in a DB at a given moment is called a *database state* or *snapshot*; it is the curent set of *instances* (or *occurrences*) in the DB. In a given state, each schema construct has its own current set of instances.  

The initial state of the DB is after the DB is first *populated* or *loaded*. Every subsequent update creates a new state of the DB. The DBMS ensures that each state is a *valid state* (it satisfies the constraints specified in the schema).  

The schema is sometimes called the *intension* and the DB state its *extension*.

# 2.2 Three-Schema Architecture and Data Independence
The three-schema architecture helps achieve and visualise the characteristics of self-description, insulation of programs and data, support of multiple user views.

## 2.2.1 The Three-Schema Architecture
The goal of the three-schema architecture is to separate user applications from the physical DB. Schemas can be defined at:

* the *internal level*; the internal schema describes the physical storage structure of the DB, using a physical data model.
* the *conceptual level*; the conceptual schema describes the structure of the whole DB, hiding details of physical storage. It uses a representational data model, describing entities, datatypes, relationships, operations and constraints.
* the *external* or *view level*; the *external schemas* or *user views* each describe a part of the DB that a particular user group is interested in. They are usually implemented using representational data models.

Conceptual and external schemas may be based on the conceptual and external schema designs in a high-level conceptual data model.  

Most DBMSs do not separate all three levels completely, but they support the architecture to some extent.  

The DBMS must transform a request specified on an external schema into one on the conceptual schema, and then into one the internal schema. In the case of data retrieval, the data must be reformatted to match the external view of the user. These transformations between levels are called *mappings*.

## 2.2.2 Data Independence
*Data independence* can be defined as the capacity to change the schema at one level of a DB system without affecting the higher-level schemas.

* *Logical data independence* is the capacity to change the conceptual schema without having to change the external schemas (or application programs).  
    Changes to the conceptual schema might expand the DB, change the constraints, or reduce the DB (in which case external schemas referring only to remaining data should be unaltered).  

    Only the view definition and the mappings need to be changed in a DBMS supporting logical data independence; the application programs that reference external schema constructs must work as before.

* *Physical data independence* is the capacity to change the internal schema without having to change the conceptual or external schemas. The reorganisation of physical files to improve the performance of retrieval or updation should not affect the conceptual schema.  

Physical data independence exists in most DBs and file environments where physical details are hidden from the user. Logical data independence is harder to achieve.  

Multiple-level DBMSs must have a catalogue that includes information on how to map requests and data among various levels. Additional software is used to accomplish the mappings by referring to this information in the catalogue.
