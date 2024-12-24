-- Script for Assignment 4

-- Creating database with full name

CREATE DATABASE yourfullname;

-- Connecting to database 
\c yourfullname

-- Relation schemas and instances for assignment 2

CREATE TABLE student(sid integer,
                    pname text,
                    city text,
                    primary key (sid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(sid integer,
                      cname text,
                      salary integer,
                      primary key (sid),
                      foreign key (sid) references student (sid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE studentSkill(sid integer,
                         skill text,
                         primary key (sid, skill),
                         foreign key (sid) references student (sid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references student (sid),
                        foreign key (mid) references student (sid));

CREATE TABLE Knows(sid1 integer,
                   sid2 integer,
                   primary key(sid1, sid2),
                   foreign key (sid1) references student (sid),
                   foreign key (sid2) references student (sid));



INSERT INTO student VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 55000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 50000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO studentSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1010,'Databases'),
 (1011,'Databases'),
 (1013,'Databases'),
 (1014,'Databases'),
 (1017,'Databases'),
 (1019,'Databases'),
 (1005,'Databases'),
 (1006,'AI'),
 (1009,'Databases');
 

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012),
 (1010,1002),
 (1010,1012),
 (1010,1018);

\qecho 'Problem 1'
/*Find each pair (c, p) where c is the city and p is the sid of the student
that lives in c, and earns the lowest salary among all students living in c. You must not use set 
predicates in this query*/

\qecho 'Problem 2'
/*Find the sid and name of each student who has fewer than 2 of the com-
bined set of job skills of students who work for Netflix. By combined set
of jobskills we mean the set
{s | s is a jobskill of an employee of Netflix }
*You must not use set predicates in this query.*/

\qecho 'Problem 3'
/*Find each pairs (s1; s2) of skills such that the set of students with skill s1
is the same as the set of students with skill s2.You must not use set predicates in this query.*/


\qecho 'Problem 4'
/*Find each sid of a student who knows at least two people who (a) work for
Apple and (b) who make less than 55000.
You must not use set predicates in this query.*/


\qecho 'Problem 5'
/*Find the cname of each company, such that some student that works there
knows at-least quarter of the people that work at Amazon.*/


\qecho 'Problem 6'
/*
Find each pair (c, a) where c is the cname of each company that has at
least one manager, and a is the average salary of all employees working at
the company who are not managers
*/


\qecho 'Problem 7'
\qecho '(a)'
/*Using the GROUP BY count method, define a function
create or replace function numberOfSkills(c text)
returns table (sid integer, salary int, numberOfSkills bigint) as
$$
...
$$ language sql;
that returns for a company identified by its cname, each triple (p,
s, n) where (1) p is the sid of a student who is employed by that
company, (2) s is the salary of p, and (3) n is the number of job skills
of p. (Note that a student may not have any job skills.)*/

\qecho '(b)'
/*Test your function for Problem 7a for the companies Apple, Amazon,
and ACM.*/

\qecho '(c)'
/*Write the same function numberOfSkills as in Problem 7a but this
time without using the GROUP BY clause.*/

\qecho '(d)'
/*Test your function for Problem 7c for the companies Apple, Amazon,
and ACM.*/

\qecho '(e)'
/*Using the function numberOfSkills but without using set predicates,
write the following query: “Find each pair (c; p) where c is the name
of a company and where p is the sid of a student who (1) works for
company c, (2) makes more than 50000 and (3) has the most job
skills among all the employees who work for company c.”*/

\qecho 'Problem 8'
/*Find the sid and name of each student who knows all the
students who (a) live in Bloomington, (b) make at least
55000, and (c) have at least one skill.*/


\qecho 'Problem 9'
/*Find the cname of each company who only employs man-
agers who make more than 50000.*/

\qecho 'THIS WILL ALSO CONTAIN THE COMPANIES WHICH DO NOT HAVE ANY MANAGERS EMPLOYED.'

\qecho 'Problem 10'
/*Find the sid and name of each student who knows at least
3 people who each have at most 2 managers.*/

\qecho 'Problem 11'
/*Find the cname of each company that employs an even
number of students who have at least 2 skills*/

\qecho 'THIS WILL ALSO CONTAIN THE COMPANIES WHICH DO NOT HAVE ANY EMPLOYEEs.'

\qecho 'Problem 12'
/*Find the pairs (p1, p2) of different student sids such that
the student with sid p1 and the student with sid p2 have the
same number of skills.*/

\qecho 'Problem 13'
/*Explain how triggers can be used to implement the 
Primary key Constraint, with an example.*/


\qecho 'Problem 14'
/*Explain how triggers can be used to implement the Referential Integrity
Constraint, with an example.(You are not allowed to use postgres cascade).*/

\qecho 'Problem 15'
/*Consider two relations R(A:integer,B:integer) and S(B:integer)
and a view with the following definition:*/

/*select distinct r.A
from R r, S s
where r.A > 10 and r.B = s.B;*/

/*Suppose we want to maintain this view as a materialized
view called V(A:integer) upon the insertion of tuples in R
and in S. (You do not have to consider deletions in this question.)

Define SQL insert triggers and their associated trigger functions
on the relations R and S that implement this materialized view.
Write your trigger functions in the language ‘plpgsql.’

Make sure that your trigger functions act in an incremental way
and that no duplicates appear in the materialized view.*/


CREATE TABLE IF NOT EXISTS R(A INT, B INT);
CREATE TABLE IF NOT EXISTS S(B INT);
CREATE TABLE IF NOT EXISTS V(A INT);


/* -----------*/
--Create TRIGGERS Insert_R and Insert_S
/* -----------*/


--TEST YOUR TRIGGERS ACROSS THE BELOW RECORDS.

/* -----------*/

INSERT INTO R VALUES(15,35);
INSERT INTO S VALUES(35);
SELECT * FROM V;


INSERT INTO R VALUES(4,12);
INSERT INTO S VALUES(12);
SELECT * FROM V;

INSERT INTO R VALUES(26,13);
INSERT INTO S VALUES(11);
SELECT * FROM V;


INSERT INTO R VALUES(101,106);
INSERT INTO S VALUES(106);
SELECT * FROM V;


DROP TABLE IF EXISTS R;
DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS V;

/* -----------*/


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE yourfullname    ; 
