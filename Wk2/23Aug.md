---
title: Data and Its Applications (CS4.301)
subtitle: |
              | Monsoon 2021, IIIT Hyderabad
              | 23 August, Monday (Lecture 2)
author: Taught by Prof. Kamal Karlapalem
---

# About DBMSs
## History
Databases were initially implemented in files, but their maintenance and updation was not cost-effective, and they were creared for specific applications.  

Later, general-purpose database systems were created, which was enabled by the integration of metadata and data in the database system.

## Characteristics
Some characteristics that distinguish the database approach from a simple file-based system are:

* its self-describing nature, *i.e.*, the system catalogue which stores a complete definition of the database within the database (metadata).
* data abstraction, or the separation between the data files and their access programs.
* support for multiple views of the data
* sharing of data (multi-user transaction processing)

The persons involved in the manipulation and use of a database are usually its administrators, designers, end users, and application programmers; and designers, implementers, tool developers, and maintenance personnel.  

## Uses
The intended uses of a DBMS include:

* controlling redundancy
* restricting unauthorised access
* representing complex relationships among data
* enforcing integrity constraints
* providing backup and recovery
* providing multi-user interfaces
* persistent storage for program objects and data structures
* database interfacing using deduction rules

Further, the database approach has the advantages of
* reduced app-dev time
* flexibility
* up-to-date information
* economy of scale

However, a DBMS need not be used if the overheads of initial investment, additional hardware, generality, secuirty, recovery, integrity and concurrency control exceed a limit.

## Categories
Categories of data models include conceptual (high-level), physical (low-level) and representational (implementation-level).

* Conceptual (semantic) data models provide concepts close to the way users perceive data.
* Physical (internal) models describe details of how data is stored in the computer.
* Representational models provide concepts that fall between the above (used by many commercial DBMS implementations).

The schema (the description of the database) and the state (the actual data stored) of the database are distinguished – the former is called the _intension_ and the latter the _extension_.  

## Levels
Most databases have what is known as a _three-schema architecture_, which consists of three levels – external (applications that query the database), conceptual (independent of the DBMS) and internal (implementation and storage).

