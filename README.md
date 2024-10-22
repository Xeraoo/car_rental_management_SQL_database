# Car-Rental-Management-SQL-Database

## Table of Contents
1. [Project Overview](#project-overview)
2. [Database Model](#database-model)
3. [Database Design](#database-design)
4. [Database Use and SQL Queries](#database-use-and-sql-queries)
5. [Simple Database Operations](#simple-database-operations)
6. [Sample Graphs](#sample-graphs)
7. [References](#references)

---

### Project Overview
The goal of this project is to demonstrate the process of creating and using SQL databases. This car rental database was developed as a part of a course project for first-year Geoinformatics students. It serves as a learning tool for understanding how to work with relational databases using SQL. The database manages key information related to customers, vehicles, rentals, payments, and reviews.

### Database Model
The database consists of 13 tables, representing various components of the car rental service, such as:
- **Customers**: Personal data of clients.
- **Cars**: Detailed car specifications (technical details, availability).
- **Reservations & Rentals**: Rental periods, booking details.
- **Payments**: Methods, amounts, and statuses of payments.
- **Administration**: Admin user information.
- **Reviews**: Customer feedback and ratings.

![Wypozyczalnia Samochodowa - Notacja  Martina](https://github.com/user-attachments/assets/57a7c1a9-75de-4686-8ecb-8c88742021b7)


### Database Design
The database was designed using UML and ERD diagrams to establish relationships and constraints. The tables are linked through primary and foreign keys, ensuring data integrity. Various SQL constraints such as `NOT NULL`, `UNIQUE`, and `CHECK` were used to enforce business rules.

![Wypożyczalnia UML (2)](https://github.com/user-attachments/assets/da8754d1-af51-4406-bbe9-93ba1047e436)


### Database Use and SQL Queries
Key SQL commands used to query and manipulate the database include:
- Selecting customer or car details.
- Updating rental statuses.
- Inserting and validating new entries.
