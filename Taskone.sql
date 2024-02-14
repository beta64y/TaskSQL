CREATE DATABASE Departament

USE Departament
CREATE TABLE Employee (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Fullname NVARCHAR(255) NOT NULL,
    Age INT NOT NULL CHECK (Age >= 0),
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Salary DECIMAL(4, 2) NOT NULL CHECK (Salary >= 300 AND Salary <= 2000)
)

SELECT * FROM Employee

ALTER TABLE Employee
ALTER COLUMN Salary DECIMAL(10, 2)

INSERT INTO Employee (Fullname, Age, Email, Salary)
VALUES 
('jon snow', 30, 'js@gmail.com', 1500.50),
('arya stark', 25, 'as@gmail.com', 1200.75),
('nathan drake', 35, 'nd@gmail.com', 1200.00),
('akif isamzade', 28, 'ai@gmail.com', 1400.25),
('kilimcinin kor oglu', 32, 'kko@gmail.com', 1900.50)


UPDATE Employee SET Salary = 401.75
WHERE Id = 6

SELECT * FROM Employee
WHERE Salary BETWEEN 500 AND 1500


SELECT * FROM Employee
ORDER BY Salary DESC



CREATE TABLE students (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(55) DEFAULT 'XXXXX' NULL
)
INSERT INTO students (Name, Surname)
VALUES
    ('sarp', 'palaur'),
    ('darly', 'dixon'),
    ('faiq','agayev'),
    ('akif', NULL),
    ('zahir', 'memmedov');

select * from students


CREATE TABLE Subjects (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL)

select * from Subjects

Create TABLE Exams(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	[Date] Date, 
	SubjectId INT FOREIGN KEY REFERENCES Subjects(Id)
)
create table StudentExams(
	Id INT PRIMARY KEY IDENTITY,
	ExamResult DECIMAL(4,1),
	StudentId INT FOREIGN KEY REFERENCES students(Id),
	ExamsId INT FOREIGN KEY REFERENCES Exams(Id)

)

SELECT S.Name, S.Surname, Su.Name as 'Subject', E.Date, SE.ExamResult
from StudentExams AS SE
JOIN Students AS S
ON SE.StudentId = S.Id
JOIN Exams AS E
ON SE.ExamsId = E.Id
JOIN Subjects AS Su
ON E.SubjectId = Su.Id