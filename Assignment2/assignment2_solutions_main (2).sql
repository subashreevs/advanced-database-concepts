DROP DATABASE IF EXISTS assignment2;

CREATE DATABASE assignment2;

\c assignment2;


CREATE TABLE student(sid integer,
                    sname text,
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
   ('Databases'),
   ('WebDevelopment');

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
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks'),
 (1003,'WebDevelopment');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1007, 1017),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);

TRUNCATE TABLE Knows;

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
 (1012,1001),
 (1014,1001),
 (1018,1001),
 (1001,1001),
 (1002,1002),
 (1003,1003),
 (1004,1004),
 (1005,1005),
 (1006,1006),
 (1007,1007),
 (1008,1008),
 (1009,1009),
 (1010,1010),
 (1011,1011),
 (1012,1012),
 (1013,1013),
 (1014,1014),
 (1015,1015),
 (1016,1016),
 (1017,1017),
 (1018,1018),
 (1019,1019);


create table PC(parent integer,
               child integer);
insert into PC values
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(3,7),
(5,8),
(8,9),
(8,10),
(8,11),
(7,12),
(7,13),
(12,14),
(14,15);


-- Find each triple (c, s, sl) where c is the
-- cname of a company, s is the sid of a student who earns the low-
-- est salary at that company and knows at least someone who has
-- Operating Systems skill, and sl is the salary of s.

\qecho 'Problem-1a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT  DISTINCT 
W1.CNAME AS C,
W1.SID AS S,
W1.salary AS SL
FROM
  WORKSFOR W1,KNOWS K
WHERE
    NOT EXISTS (
     SELECT 1
     FROM WORKSFOR W2
     WHERE W1.SID != W2.SID AND W1.CNAME=W2.CNAME
      AND W1.salary > W2.salary ) 
       AND W1.SID=K.SID1
       AND EXISTS(
            SELECT 1 FROM STUDENTSKILL SS
            WHERE SS.SID=K.SID2  AND SS.SKILL='OperatingSystems' )
            ORDER BY W1.CNAME;

\qecho 'Problem-1b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT  DISTINCT 
W1.CNAME AS C,
W1.SID AS S ,
W1.salary AS SL
FROM
WORKSFOR W1 , KNOWS K
WHERE W1.CNAME NOT IN (
     SELECT W2.CNAME FROM WORKSFOR W2
     WHERE W1.SID<>W2.SID AND W1.SALARY > W2.SALARY) 
     AND W1.SID=K.SID1
     AND K.SID2 IN (
     SELECT SS.SID FROM STUDENTSKILL SS
     WHERE SS.SKILL ='OperatingSystems')
     ORDER BY W1.CNAME;


\qecho 'Problem-1c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.
SELECT W.CNAME AS C, W.SID AS S, W.SALARY SL FROM
( 
SELECT 
W1.CNAME,
W1.SID ,
W1.salary
FROM  WORKSFOR W1,KNOWS K , STUDENTSKILL SS
WHERE W1.SID=K.SID1 AND SS.SID=K.SID2 AND SS.SKILL='OperatingSystems'
EXCEPT 
SELECT  DISTINCT
W1.CNAME,
W1.SID ,
W1.salary
FROM  WORKSFOR W1, WORKSFOR W2
WHERE W1.SID != W2.SID AND W1.CNAME=W2.CNAME AND W1.salary > W2.salary) W
ORDER BY W.CNAME;


-- Find the name, salary and city of each student who (a) lives in a city where no one has the Networks skill
-- and (b) earns the highest salary in his/her company.

\qecho 'Problem-2a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT S1.SNAME,W.SALARY,S1.CITY
FROM  STUDENT S1,WORKSFOR W
WHERE
   W.SID=S1.SID AND
   NOT EXISTS (
   SELECT 1 FROM  STUDENT S2,STUDENTSKILL SS 
   WHERE S2.SID = SS.SID AND  S1.CITY = S2.CITY AND  SS.SKILL = 'Networks')  
   AND  NOT EXISTS ( 
         SELECT  1 FROM  WORKSFOR W1, WORKSFOR W2
          WHERE W1.SID <> W2.SID AND W1.CNAME=W2.CNAME
          AND W1.SALARY < W2.SALARY
          AND W1.SID=S1.SID) ORDER BY S1.SNAME;

\qecho 'Problem-2b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT S1.SNAME,W.SALARY,S1.CITY
FROM  STUDENT S1,WORKSFOR W
WHERE
     W.SID=S1.SID AND
     S1.CITY NOT IN (
    SELECT S2.CITY FROM  STUDENT S2,STUDENTSKILL SS 
    WHERE S2.SID = SS.SID AND  SS.SKILL = 'Networks') 
     AND  S1.SID NOT IN ( 
          SELECT  W1.SID FROM  WORKSFOR W1, WORKSFOR W2
          WHERE W1.SID <> W2.SID AND W1.CNAME=W2.CNAME
          AND W1.SALARY < W2.SALARY) ORDER BY S1.SNAME;

\qecho 'Problem-2c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.
SELECT S.SNAME AS SNAME ,S.SALARY AS SALARY ,S.CITY AS CITY FROM (
SELECT DISTINCT S1.SNAME,W.SALARY,S1.CITY
FROM  STUDENT S1,STUDENT S2,WORKSFOR W --,PERSONSKILL PS
WHERE   W.SID=S1.SID AND   S1.CITY = S2.CITY-- AND P1.PID = PS.PID --AND PS.SKILL <> 'Networks'
EXCEPT
SELECT DISTINCT S1.SNAME,W.SALARY,S1.CITY
FROM  STUDENT S1,WORKSFOR W,STUDENTSKILL SS
WHERE   W.SID=S1.SID AND S1.SID = SS.SID AND SS.SKILL = 'Networks'   
EXCEPT 
SELECT 
DISTINCT S1.SNAME,W1.SALARY,S1.CITY
FROM  STUDENT S1, WORKSFOR W1, WORKSFOR W2
WHERE W1.SID=S1.SID AND W1.SID <> W2.SID 
AND W1.CNAME=W2.CNAME AND W1.SALARY < W2.SALARY ) S
ORDER BY S.SNAME;



--Find each pair (c1, c2) of cnames of different companies such that
--no employee of c1 and no employee of c2 live in Chicago.

\qecho 'Problem-3a'
--Formulate this query in Pure SQL by only using the
--EXISTS or NOT EXISTS set predicates. You can not use the set operations INTERSECT, UNION, and EXCEPT.
SELECT C1.CNAME ,C2.CNAME FROM COMPANY C1,COMPANY C2
WHERE C1.CNAME<>C2.CNAME
AND  EXISTS(
SELECT * FROM STUDENT S1,WORKSFOR W1 
WHERE S1.CITY= 'Chicago' AND S1.SID=W1.SID AND C1.CNAME<>W1.CNAME AND C2.CNAME<>W1.CNAME)
ORDER BY C1.CNAME,C2.CNAME;

\qecho 'Problem-3b'
--Formulate this query in Pure SQL by only using the IN, NOT IN, SOME, or ALL set membership predicates.
--You can not use the set operations INTERSECT, UNION, and EXCEPT.

SELECT C1.CNAME ,C2.CNAME FROM COMPANY C1,COMPANY C2
WHERE C1.CNAME<>C2.CNAME
AND C1.CNAME NOT IN (SELECT W1.CNAME FROM STUDENT S1, WORKSFOR W1 
                          WHERE S1.CITY='Chicago' AND S1.SID=W1.SID)
AND C2.CNAME NOT IN (SELECT W1.CNAME FROM STUDENT S1, WORKSFOR W1 
                          WHERE S1.CITY='Chicago' AND S1.SID=W1.SID)
ORDER BY C1.CNAME,C2.CNAME;

\qecho 'Problem-3c'
--Formulate this query in Pure SQL by only using the set operations INTERSECT, UNION, and EXCEPT.
SELECT C1.CNAME ,C2.CNAME FROM COMPANY C1,COMPANY C2
WHERE C1.CNAME<>C2.CNAME
EXCEPT 
SELECT DISTINCT C1.CNAME ,C2.CNAME FROM COMPANY C1,COMPANY C2, STUDENT S1, WORKSFOR W1 
WHERE C1.CNAME<>C2.CNAME AND S1.CITY='Chicago' AND S1.SID=W1.SID AND W1.CNAME=C1.CNAME
EXCEPT
SELECT DISTINCT C2.CNAME , C1.CNAME FROM COMPANY C1,COMPANY C2, STUDENT S1, WORKSFOR W1 
WHERE C1.CNAME<>C2.CNAME AND S1.CITY='Chicago' AND S1.SID=W1.SID AND W1.CNAME=C1.CNAME;



--Reconsider Problem 1. Formulate this query in RA SQL
\qecho 'Problem-4b'
SELECT W.CNAME AS C, W.SID AS P, W.SALARY  FROM
( 
SELECT 
W1.CNAME,
W1.SID ,
W1.salary
FROM  WORKSFOR W1
JOIN KNOWS K ON  W1.SID=K.SID1
JOIN STUDENTSKILL SS ON SS.SID=K.SID2 AND SS.SKILL='OperatingSystems'
EXCEPT 
SELECT  DISTINCT
W1.CNAME,
W1.SID ,
W1.salary
FROM WORKSFOR W1
JOIN WORKSFOR W2 ON W1.SID != W2.SID AND W1.CNAME=W2.CNAME AND W1.salary > W2.salary ) W
ORDER BY W.CNAME;


--Reconsider Problem 2. Formulate this query in RA SQL
\qecho 'Problem-5b'
SELECT S.SNAME AS SNAME ,S.SALARY AS SALARY ,S.CITY AS CITY FROM (
SELECT DISTINCT S1.SNAME,W.SALARY,S1.CITY
FROM  STUDENT S1 
     JOIN STUDENT S2 ON  S1.CITY = S2.CITY 
     JOIN WORKSFOR W ON W.SID=S1.SID  
EXCEPT
SELECT DISTINCT S1.SNAME,W.SALARY,S1.CITY
FROM  STUDENT S1
     JOIN WORKSFOR W ON W.SID=S1.SID
     JOIN STUDENTSKILL SS ON S1.SID = SS.SID AND SS.SKILL = 'Networks'   
EXCEPT 
SELECT 
DISTINCT S1.SNAME,W1.SALARY,S1.CITY
FROM  STUDENT S1
     JOIN WORKSFOR W1 ON W1.SID=S1.SID 
     JOIN WORKSFOR W2 ON W1.SID <> W2.SID
AND W1.CNAME=W2.CNAME AND W1.SALARY < W2.SALARY ) S
ORDER BY S.SNAME;

--Reconsider Problem 3. Formulate this query in RA SQL
\qecho 'Problem-6b'
SELECT C1.CNAME ,C2.CNAME FROM COMPANY C1 
JOIN COMPANY C2 ON C1.CNAME<>C2.CNAME
EXCEPT 
SELECT DISTINCT C1.CNAME ,C2.CNAME FROM COMPANY C1 
JOIN COMPANY C2 ON C1.CNAME<>C2.CNAME
JOIN STUDENT S1 ON S1.CITY='Chicago'
JOIN WORKSFOR W1 ON S1.SID=W1.SID AND W1.CNAME=C1.CNAME
EXCEPT
SELECT DISTINCT C2.CNAME , C1.CNAME FROM COMPANY C1 
JOIN COMPANY C2 ON C1.CNAME<>C2.CNAME
JOIN STUDENT S1 ON S1.CITY='Chicago'
JOIN WORKSFOR W1 ON S1.SID=W1.SID AND W1.CNAME=C1.CNAME;

\qecho 'Problem 10'
CREATE MATERIALIZED VIEW CompanyKnownStudent AS      
SELECT DISTINCT W1.SID 
FROM WORKSFOR W1, KNOWS K1,KNOWS K2
WHERE W1.SID=K1.SID2 AND W1.SID=K2.SID2 AND
K1.SID1<>K1.SID2 AND K2.SID1<>K2.SID2 AND K1.SID1<>K2.SID1
AND EXISTS (SELECT 1 FROM WORKSFOR W2,WORKSFOR W3
             WHERE W2.SID=K1.SID1 AND W3.SID=K2.SID1 AND W1.CNAME=W2.CNAME AND W1.CNAME=W3.CNAME
             AND W1.SALARY>W2.SALARY AND W1.SALARY>W3.SALARY);
SELECT * FROM CompanyKnownStudent;

\qecho 'Problem 11'
CREATE FUNCTION SkillOnlyOneStudent(skill1 TEXT)
RETURNS TABLE(SID1 TEXT,SID2 TEXT) AS
$$
SELECT DISTINCT SS1.SID AS SID1 ,SS2.SID AS SID2 
FROM STUDENTSKILL SS1, STUDENTSKILL SS2
WHERE SS1.SID<>SS2.SID AND SS1.SKILL <> SS2.SKILL AND SS1.SKILL= skill1
ORDER BY SS1.SID,SS2.SID;
$$ LANGUAGE SQL;

SELECT * FROM SkillOnlyOneStudent('WebDevelopment');

\qecho 'Problem 12'
CREATE OR REPLACE VIEW sameGeneration AS
WITH RECURSIVE samegeneration(n1, n2) AS (
    -- Base rule: every node is in the same generation as itself
    SELECT parent AS n1, parent AS n2
    FROM PC
    UNION
    SELECT child AS n1, child AS n2
    FROM PC
    UNION
    -- Inductive rule
    SELECT PC1.child AS n1, PC2.child AS n2
    FROM PC PC1
    JOIN sameGen SG ON PC1.parent = SG.n1
    JOIN PC PC2 ON PC2.parent = SG.n2
    WHERE PC1.child <> PC2.child
)
SELECT DISTINCT * FROM samegeneration
ORDER BY n1, n2;
 
SELECT * FROM sameGeneration;


-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE assignment2;

