---
title: Fundamentals of Database Systems
subtitle: Chapter 1: Databases and Database Users
authors: |
         | Ramez Elmasri
         | Shamkant B Navathe
---

# 1.1 Introduction
A *database* is a collection of related data. *Data* is comprised of facts that can be recorded and have implicit meaning.  

The properties of a database are:

* it represents some aspect of the real world – a *miniworld* or *universe of discourse* (UoD)
* it is logically coherent and has inherent meaning
* it is designed, built and populated with data for a specific purpose

A *database management system* (DBMS) is a computerised system that enables users to create and maintain a database. It is a general-purpose software system that facilities defining, constructing, manipulating and sharing databases among users or applications.

* *defining* – specifying datatypes, structures and contraints of data. The definition is stored as a database catalogue or *metadata*.
* *constructing* – storing the data on some medium.
* *manipulating* – functions such as querying the database, updating the data and generating reports from the data.
* *sharing*

An *application program* accesses the database by sending queries/requests to the DBMS. A *query* causes some data to be retrieved, while a *transaction* causes some to be read and some to be written.  

The DBMS also protects and maintains the database. *Protection* includes system as well as security protection; *maintenance* allows the DB to evolve over time.  

The DB and the DBMS software are together called a *database system*.

# 1.2 An Example
Design of a new DB or a new application for a DB starts with *requirements specification and analysis* – the requirements are documented and converted to a *conceptual design*, from which a DB implementation can be created (through *logical* and *physical design*).  

# 1.3 Characteristics of the Database Approach
File processing approaches to data storage leads to redundancy, wasted storage space, and efforts to maintain consistency. In contrast, the database approach has these characteristics:

* self-describing nature
* insulation between programs and data (data abstraction)
* support of multiple views
* sharing of data and multiuser transaction processing

## 1.3.1 Self-Describing Nature of a DB System
The DB contains a complete definition of its structure and constraints, stored in the DBMS catalogue as metadata (some newer systems don't require metadata).  

### 1.3.2 Insulation between Programs and Data; Data Abstraction
DBMS access programs do not need to be changed even if the structure of the file storing the data is altered. Only the catalogue's description of the file (or record) needs to be updated; the program refers to this to access the data. This is called *program-data independence*.  

Some DB systems allow users to define *operations* (or functions, or methods) on data as well. The operation's *interface* (or signature) is distinct from its *implementation* (or method (don't get confused)). They are invoked by their interfaces, independent of their implementations. This is called program-operation independence.  

Both the above characteristics are enabled by *data abstraction*. The DBMS gives users a *conceptual representation* of data that does not include the storage and implementation details, using the *data model*.  

## 1.3.3 Support of Multiple Views of the Data
Different users can have different views of the data, which may be a subset of the database or contain virtual data (which is not stored but can be derived from stored data).  

## 1.3.4 Sharing of Data and Multiuser Transaction Processing
The DBMS must include *concurrency control* software to ensure that several users updating the same data do so in a controlled manner. Applications that require this (like flight-booking systems) are called *online transaction processing* applications.  

A *transaction* is an executing program or process that includes one or more DB accesses (two definitions? idk). DBMSs must exhibit:

* *isolation* (each transaction appears to execute independently from others)
* *atomicity* (either all DB operations in a transaction are executed or none are)

# 1.4 Actors on the Scene
The following are the people whose jobs involve the day-to-day use of a large DB.

## 1.4.1 Database Administrators
The DBA administers the primary (the DB itself) and the secondary (the DBMS and other softwares) resources. They authorise access to, coordinate and monitor the use of, and acquire resources for the DB.

## 1.4.2 Database Designers
Database designers identify the data to be stored in the DB and choose appropriate structures to represent and store it. They develop views of the DB that meet the requirements of the groups of users.

## 1.4.3 End Users
End users are the people whose jobs require access to the DB for querying/updating/generating reports. There are various types of end users:

* *naive* or *parametric end users* constantly query and update the DB through standard (or *canned*) transactions, sometimes in the form of a mobile app interface.
* *casual end users* occasionally access the DB but need different data each time. They use a sophisticated DB query interface and are typically middle- or high-level managers.
* *sophisticated end users* are those who thoroughly familiarise themselves with the DBMS facilities to implement their own applications.
* *standalone users* maintain personal DBs using program packages that provide convenient menu-based or graphical interfaces.

## 1.4.4 System Analysts and Application Programmers
System analysts determine the requirements of users and develop specifications for the appropriate canned transactions. Application programmers implement these specifications.

# 1.5 Workers behind the Scene
The following people are associated with the design, development and operation of the DBMS software and system environment.

* *DBMS system designers and implementers* deisgn and implement the DBMS modules and interfaces as a software package. DBMS modules include those for implementing the catalogue, query language processing, interface processing, accessing and buffering data, concurrency control and handling data recovery and security. The DBMS interfaces with the OS, compilers and other system software.
* *Tool developers* design and implement software packages that facilitate DB modelling and design, DB system design and improved performance. These tools are optional packages, often purchased separately, like DB design, performance monitoring, natural language or graphical interfaces, prototyping, simulation and test data generation.
* *Operators and maintenance personnel* or system administration personnel are responsible for the actual running and maintenance of the hardware and software environment of the DB system.

# 1.6 Advantages of Using the DBMS Approach
## 1.6.1 Controlling Redundancy
When (as in file processing approaches) every user group maintains its own files, the same data is frequently repeated in many groups' versions. This redundancy leads to issues like duplication of effort, waste of storage space and possible inconsistencies in data. The DBMS approach stores each data item in only one place, which is called *data normalisation*.  

*Controlled redundancy*, however, sometimes improves the performance by enabling the DBMS to avoid searching multiple files; this is called *denormalisation*.

## 1.6.2 Restricting Unauthorised Access
A DBMS should provide a *security and authorisation subsystem*, which the DBA uses to specify account restrictions. Similar controls can be applied on the DBMS software itself; for example, only the DBA staff can create accounts.

## 1.6.3 Providing Persistent Storage for Program Objects
This is one of the main reasons for object-oriented DB systems. It allows data structures to be saved in files, past the lifetime of the programs that created them – such objects are called *persistent*.  

Traditional DB systems suffer from the *impedance mismatch problem* – the inconsistency between the PL's data structures and the DBMS's. OODB systems offer compatibility with certain PLs.

## 1.6.4 Providing Storage Structures and Search Techniques for Efficient Query Processing
DBMSs often use auxiliary files called *indexes* to speed up disk search for records. They also have a buffering or caching module to maintain parts of the DB in main memory buffers (distinct from the OS's facility for this).  

The query processing and optimisation module of the DBMS chooses an efficient plan to execute each query based the storage structures. The DBA staff carry out physical DB design and tuning, which entails choosing which indexes to create and maintain.

## 1.6.5 Providing Backup and Recovery
A DBMS must have a *backup and recovery subsystem* to recover from hardware or software failures.

## 1.6.6 Providing Multiple User Interfaces
A DBMS should provide various interfaces, like apps (mobile users), query languages (casual users), PL interfaces (application programmers), forms and command codes (parametric users), and menu-driven or natural language interfaces (standalone users). Menu-driven or form-style interfaces come under GUIs.

## 1.6.7 Representing Complex Relationships among Data
A DBMS should be able to represent and define complex relationships among data, and to retrieve and update data according to these relationships.

## 1.6.8 Enforcing Integrity Constraints
The simplest kind of integrity constraint is assigning a datatype to each data item; a more complex one is to state a relationship between records in different files (called a *referential integrity* constraint). We can also specify the uniqueness of some values (called a *uniqueness* or *key* constraint). Such constraints are sometimes called *business rules*.  

Rules that pertain to a specific data model are called inherent rules of the data model.

## 1.6.9 Permitting Inferencing and Actions using Rules and Triggers
*Deductive database systems* allow us to define deduction rules to infer new information. These can be declared as *rules*, and compiled and maintained by the DBMS.  
It is possible to associate *triggers* with tables, which perform some operations to some tables when activated by an update. *Stored procedures* are more involved way to enforce rules, which are invoked when certain conditions are met.   

*Active database systems* provide active rules, which can automatically initiate actions when certain events and conditions occur.

## 1.6.10 Additional Implications of Using the Database Approach
### Potential for Enforcing Standards
The DBA can define and enforce standards among DB users, which facilitates communication and cooperation among them. Standards can be defined for names, formats, display formats, report structures, terminology, etc.

### Reduced Application Development Time
Developing a new application using DBMS facilities takes very little time once the DB is up and running.

### Flexibility
The structure of a DB can be changed without affecting the stored data and application programs.

### Availability of Up-to-Date Information
A DBMS makes the DB available to all users, making updates visible instantly.

### Economies of Scale
Data and applications can be consolidated, reducing the wasteful overlap between activities of data-processing personnel in different projects.
