/*create table LessonPlan(ID decimal(9,0) CONSTRAINT LessonPlanPrimary PRIMARY KEY, GroupsID decimal(9,0), SubjectsID decimal(9,0), TypeOfClassesID decimal(9,0), TeachersID varchar(12), 
QuantityLessons decimal(9,0))

drop table LessonPlan

alter table LessonPlan
drop constraint LessonPlanSubjectsForeign FOREIGN KEY (SubjectsID) REFERENCES Subjects(ID) ON DELETE CASCADE

alter table LessonPlan
drop constraint LessonPlanTypeOfClassesForeign FOREIGN KEY (TypeOfClassesID) REFERENCES TypeOfClasses(ID) ON DELETE CASCADE

alter table LessonPlan
drop constraint LessonPlanTeachersForeign FOREIGN KEY (TeachersID) REFERENCES Teachers(PersonnelNumber) ON DELETE CASCADE

alter table LessonPlan
drop constraint LessonPlanGroupsForeign FOREIGN KEY (GroupsID) REFERENCES Groups(ID) ON DELETE CASCADE*/



create table Students(CreditBookNumber varchar(7) CONSTRAINT StudentsPrimary PRIMARY KEY, PersonalInfo varchar(50) NOT NULL, 
EntryToUniversity date NOT NULL, GroupsID decimal(9,0) NOT NULL)

CREATE TABLE Specialties(ID decimal(9,0) CONSTRAINT SpecialtiesPrimary PRIMARY KEY, SpecialityName varchar(50) NOT NULL)

CREATE TABLE Groups(ID decimal(9,0) CONSTRAINT GroupsPrimary PRIMARY KEY, GroupName varchar(6) NOT NULL)

alter table Students
add constraint StudentsGroupsForeign FOREIGN KEY (GroupsID) REFERENCES Groups(ID)

create table Subjects(ID decimal(9,0) CONSTRAINT SubjectsPrimary PRIMARY KEY, ObjectName varchar(35) NOT NULL)

create table Teachers(PersonnelNumber varchar(12) CONSTRAINT TeachersPrimary PRIMARY KEY, PersonalInfo varchar(50) NOT NULL)

create table TypeOfClasses(ID decimal(9,0) CONSTRAINT TypeOfClassesPrimary PRIMARY KEY, TypeName varchar(20) NOT NULL)

create table Attendance(ID decimal(9,0) CONSTRAINT AttendancePrimary PRIMARY KEY, StudentsID varchar(7) NOT NULL, SubjectsID decimal(9,0) NOT NULL, 
TypeOfClassesID decimal(9,0) NOT NULL, TeachersID varchar(12) NOT NULL, LessonDate date NOT NULL)

alter table Attendance
add constraint AttendanceStudentsForeign FOREIGN KEY (StudentsID) REFERENCES Students(CreditBookNumber) ON DELETE CASCADE

alter table Attendance
add constraint AttendanceSubjectsForeign FOREIGN KEY (SubjectsID) REFERENCES Subjects(ID) ON DELETE CASCADE

alter table Attendance
add constraint AttendanceTypeOfClassesForeign FOREIGN KEY (TypeOfClassesID) REFERENCES TypeOfClasses(ID) ON DELETE CASCADE

alter table Attendance
add constraint AttendanceTeachersForeign FOREIGN KEY (TeachersID) REFERENCES Teachers(PersonnelNumber) ON DELETE CASCADE

alter table Teachers
add SpecialtiesID decimal(9,0) NOT NULL

alter table Teachers
add constraint TeachersSpecialtiesForeign FOREIGN KEY (SpecialtiesID) REFERENCES Specialties(ID) ON DELETE CASCADE
--------Ограничения---------------------------
alter table Students
ADD CONSTRAINT PersonalInfoLike CHECK (PersonalInfo NOT LIKE '%[^a-z]% %[^a-z]%');

alter table Students
ADD CONSTRAINT CreditBookNumberLike CHECK (CreditBookNumber LIKE '[a-z][a-z]-[0-9][0-9][0-9][0-9]');

alter table Groups
ADD CONSTRAINT GroupNameLike CHECK (GroupName LIKE '[a-z][a-z]-[1-9][1-9]');

alter table Groups
ADD CONSTRAINT GroupIDCheck CHECK (ID>0);

alter table Specialties
ADD CONSTRAINT SpecialityNameLike CHECK (SpecialityName NOT LIKE '%[^a-z]%');

alter table Specialties
ADD CONSTRAINT SpecialtiesIDCheck CHECK (ID>0);

alter table Subjects
ADD CONSTRAINT SubjectsIDCheck CHECK (ID>0);

alter table Subjects
ADD CONSTRAINT ObjectNameLike CHECK (ObjectName NOT LIKE '%[^a-z]% %[^a-z]%');

alter table Teachers
ADD CONSTRAINT PersonnelNumberLike CHECK (PersonnelNumber LIKE '%[0-9][0-9][0-9][0-9][0-9][0-9]%');

alter table Teachers
ADD CONSTRAINT PersonalInfoTeachersLike CHECK (PersonalInfo NOT LIKE '%[^a-z]% %[^a-z]%');

alter table TypeOfClasses
ADD CONSTRAINT TypeOfClassesIDCheck CHECK (ID>0);

alter table TypeOfClasses
ADD CONSTRAINT TypeNameLike CHECK (TypeName NOT LIKE '%[^a-z]%');
-----------Заполнения таблиц---------------------
---------LessonPlan------------
/*INSERT INTO LessonPlan
VALUES (1, 1, 1, 1,'100001', 18)
INSERT INTO LessonPlan
VALUES (2, 1, 1, 2,'100002', 18)
INSERT INTO LessonPlan
VALUES (3, 1, 1, 3,'100003', 9)
INSERT INTO LessonPlan
VALUES (4, 1, 2, 1,'200005', 18)
INSERT INTO LessonPlan
VALUES (5, 1, 2, 2,'200004', 18)
INSERT INTO LessonPlan
VALUES (6, 1, 6, 1,'500013', 9)
INSERT INTO LessonPlan
VALUES (7, 1, 6, 3,'500014', 18)
INSERT INTO LessonPlan
VALUES (8, 1, 4, 2,'400010', 18)
INSERT INTO LessonPlan
VALUES (9, 2, 1, 1,'100001', 18)
INSERT INTO LessonPlan
VALUES (10, 2, 1, 2,'100002', 18)
INSERT INTO LessonPlan
VALUES (11, 2, 1, 3,'100003', 9)
INSERT INTO LessonPlan
VALUES (12, 2, 2, 1,'200005', 18)
INSERT INTO LessonPlan
VALUES (13, 2, 2, 2,'200004', 18)
INSERT INTO LessonPlan
VALUES (14, 2, 6, 1,'500013', 9)
INSERT INTO LessonPlan
VALUES (15, 2, 6, 3,'500014', 18)
INSERT INTO LessonPlan
VALUES (16, 2, 4, 2,'400010', 18)*/

---------Groups-----------
INSERT INTO Groups 
VALUES (1, 'AA-41')
INSERT INTO Groups 
VALUES (2, 'AA-42')
INSERT INTO Groups 
VALUES (3, 'BB-31')
INSERT INTO Groups 
VALUES (4, 'BB-32')
INSERT INTO Groups 
VALUES (5, 'CC-41')
--------Specialties---------
INSERT INTO Specialties
VALUES (1, 'Physicist')
INSERT INTO Specialties
VALUES (2, 'Mathematician')
INSERT INTO Specialties
VALUES (3, 'Historian')
INSERT INTO Specialties
VALUES (4, 'Linguist')
INSERT INTO Specialties
VALUES (5, 'Programmer')
INSERT INTO Specialties
VALUES (6, 'Economist')
INSERT INTO Specialties
VALUES (7, 'Psychologist')
INSERT INTO Specialties
VALUES (8, 'Ecologist')
------------Subjects-----------
INSERT INTO Subjects
VALUES (1, 'Physics')
INSERT INTO Subjects
VALUES (2, 'Mathematical analysis')
INSERT INTO Subjects
VALUES (3, 'Ukrainian language')
INSERT INTO Subjects
VALUES (4, 'English')
INSERT INTO Subjects
VALUES (5, 'History')
INSERT INTO Subjects
VALUES (6, 'Programming')
INSERT INTO Subjects
VALUES (7, 'Computer Science')
INSERT INTO Subjects
VALUES (8, 'Ecology')
INSERT INTO Subjects
VALUES (9, 'Psychology')
INSERT INTO Subjects
VALUES (10, 'Discrete Math')
INSERT INTO Subjects
VALUES (11, 'Economy')
INSERT INTO Subjects
VALUES (12, 'Operating Systems')
------------TypeOfClasses-----------------------
INSERT INTO TypeOfClasses
VALUES (1, 'Lecture')
INSERT INTO TypeOfClasses
VALUES (2, 'Practice')
INSERT INTO TypeOfClasses
VALUES (3, 'Lab')
-------------Teachers-------------------------------
INSERT INTO Teachers
VALUES (100001, 'Audrey Smith', 1)
INSERT INTO Teachers
VALUES (100002, 'Bruce Robertson', 1)
INSERT INTO Teachers
VALUES (100003, 'Alison Black', 1)
INSERT INTO Teachers
VALUES (200004, 'Boris Jones', 2)
INSERT INTO Teachers
VALUES (200005, 'Carl Murphy', 2)
INSERT INTO Teachers
VALUES (200006, 'Carla Williams', 2)
INSERT INTO Teachers
VALUES (300007, 'Catherine Edwards', 3)
INSERT INTO Teachers
VALUES (300008, 'Cliff Birds', 3)
INSERT INTO Teachers
VALUES (300009, 'Curtis Cook', 3)
INSERT INTO Teachers
VALUES (400010, 'Claudia Sinclair', 4)
INSERT INTO Teachers
VALUES (400011, 'Constance London', 4)
INSERT INTO Teachers
VALUES (400012, 'Daisy Nail', 4)
INSERT INTO Teachers
VALUES (500013, 'Dexter Round', 5)
INSERT INTO Teachers
VALUES (500014, 'Deborah Waite', 5)
INSERT INTO Teachers
VALUES (500015, 'Douglas Fairy', 5)
INSERT INTO Teachers
VALUES (600016, 'Dianne Brook', 6)
INSERT INTO Teachers
VALUES (600017, 'Elvin Thomas', 6)
INSERT INTO Teachers
VALUES (600018, 'Frankie Walls', 6)
INSERT INTO Teachers
VALUES (700019, 'Gerald Robin', 7)
INSERT INTO Teachers
VALUES (700020, 'James Allford', 7)
INSERT INTO Teachers
VALUES (700021, 'Joanna Kingsman', 7)
INSERT INTO Teachers
VALUES (800022, 'Kimberly Mason', 8)
INSERT INTO Teachers
VALUES (800023, 'Kent Peacock', 8)
INSERT INTO Teachers
VALUES (800024, 'Louis Sheldon', 8)
-------------Students--------------------------
INSERT INTO Students
VALUES ('AA-4101','Rodion Zaleskin','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4102','Aldous Hart','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4103','Naum Ivanov','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4104','Kantidian Markov','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4105','Kirsan Sidorov','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4106','Ruvim Fokin','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4107','Sofoniy Koshelev','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4108','Filimon Scherbakov','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4109','Pahom Kuzymin','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4110','Sofon Sokolov','2014-09-01',1)
INSERT INTO Students
VALUES ('AA-4201','Eleonora Belousova','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4202','Bereslava Alekseeva','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4203','Kseniya Polyakova','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4204','Fortunat Agafonov','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4205','Eremey Sergeev','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4206','Emmanuil Rozhkov','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4207','Vysheslav Efimov','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4208','Elena Borisova','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4209','Antipa Kabanov','2014-09-01',2)
INSERT INTO Students
VALUES ('AA-4210','Yanuariy Vladimirov','2014-09-01',2)
INSERT INTO Students
VALUES ('BB-3101','Bogdan Galkin','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3102','Yaroslava Sorokina','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3103','Alla Efimova','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3104','Erofey Makarov','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3105','Anfisa Mironova','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3106','Evangelina Mihaylova','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3107','Glafira Stepanova','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3108','Zhelya Ivanova','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3109','Feodora Ershova','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3110','Goluba Alekseeva','2013-09-01',3)
INSERT INTO Students
VALUES ('BB-3201','Lika Pavlova','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3202','Firs Lavrentyev','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3203','Stanislava Orlova','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3204','Makedoniy Hohlov','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3205','Saveriy Bespalov','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3206','Velizar Sazonov','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3207','Misha Klimchuk','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3208','Darina Sokolova','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3209','Irina Kiseleva','2013-09-01',4)
INSERT INTO Students
VALUES ('BB-3210','Kirik Simonov','2013-09-01',4)
INSERT INTO Students
VALUES ('CC-4101','Apollinariy Gorbachev','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4102','Misail Gusev','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4103','Marin Hohlov','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4104','Efim Tarasov','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4105','Izmail Sobolev','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4106','Kira Cvetkova','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4107','Venyyamin Veselov','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4108','Zabava Vasilyeva','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4109','Galaktion Volkov','2014-09-01',5)
INSERT INTO Students
VALUES ('CC-4110','Afanasiya Andreeva','2014-09-01',5)
----------Attendance---------------------------------
INSERT INTO Attendance
VALUES (1,'AA-4101',1,1,100001,'2016-09-10')
INSERT INTO Attendance
VALUES (2,'AA-4102',1,1,100001,'2016-09-10')
INSERT INTO Attendance
VALUES (3,'AA-4103',1,1,100001,'2016-09-10')
INSERT INTO Attendance
VALUES (4,'AA-4209',1,1,100001,'2016-09-10')
INSERT INTO Attendance
VALUES (5,'AA-4210',1,1,100001,'2016-09-10')
INSERT INTO Attendance
VALUES (6,'BB-3202',2,1,200005,'2016-09-10')
INSERT INTO Attendance
VALUES (7,'BB-3208',2,1,200005,'2016-09-10')
INSERT INTO Attendance
VALUES (8,'BB-3210',2,1,200005,'2016-09-10')
INSERT INTO Attendance
VALUES (9,'AA-4101',2,2,200004,'2016-09-10')
INSERT INTO Attendance
VALUES (10,'AA-4101',4,2,400012,'2016-09-10')
INSERT INTO Attendance
VALUES (11,'CC-4101',4,1,400011,'2016-09-10')
INSERT INTO Attendance
VALUES (12,'CC-4101',8,2,800022,'2016-09-10')
INSERT INTO Attendance
VALUES (13,'CC-4109',4,1,400011,'2016-09-10')
INSERT INTO Attendance
VALUES (14,'CC-4110',8,2,800022,'2016-09-10')
INSERT INTO Attendance
VALUES (15,'AA-4101',1,3,100003,'2016-09-12')
INSERT INTO Attendance
VALUES (16,'AA-4102',1,3,100003,'2016-09-12')
INSERT INTO Attendance
VALUES (17,'AA-4203',2,2,200004,'2016-09-12')
INSERT INTO Attendance
VALUES (18,'AA-4201',2,2,200004,'2016-09-12')
INSERT INTO Attendance
VALUES (19,'AA-4205',2,2,200004,'2016-09-12')
INSERT INTO Attendance
VALUES (20,'CC-4104',11,1,600018,'2016-09-12')
INSERT INTO Attendance
VALUES (21,'CC-4106',11,1,600018,'2016-09-12')
INSERT INTO Attendance
VALUES (22,'AA-4102',4,2,400011,'2016-09-15')
INSERT INTO Attendance
VALUES (23,'AA-4103',4,2,400011,'2016-09-15')
INSERT INTO Attendance
VALUES (24,'AA-4106',4,2,400011,'2016-09-15')
INSERT INTO Attendance
VALUES (25,'AA-4107',4,2,400011,'2016-09-15')
INSERT INTO Attendance
VALUES (26,'AA-4201',1,3,100003,'2016-09-15')
INSERT INTO Attendance
VALUES (27,'AA-4203',1,3,100003,'2016-09-15')
INSERT INTO Attendance
VALUES (28,'AA-4207',1,3,100003,'2016-09-15')
INSERT INTO Attendance
VALUES (29,'BB-3201',2,2,200004,'2016-09-28')
INSERT INTO Attendance
VALUES (30,'BB-3203',2,2,200004,'2016-09-28')
INSERT INTO Attendance
VALUES (31,'BB-3207',2,2,200004,'2016-09-28')
INSERT INTO Attendance
VALUES (32,'AA-4205',1,3,100003,'2017-01-10')
INSERT INTO Attendance
VALUES (33,'AA-4207',1,3,100003,'2016-01-10')
INSERT INTO Attendance
VALUES (34,'AA-4210',1,3,100003,'2016-01-10')
INSERT INTO Attendance
VALUES (35,'BB-3110',6,1,500014,'2016-01-10')
INSERT INTO Attendance
VALUES (36,'BB-3206',6,1,500014,'2016-01-10')
INSERT INTO Attendance
VALUES (37,'BB-3209',6,1,500014,'2016-01-10')
INSERT INTO Attendance
VALUES (38,'CC-4104',8,3,800022,'2016-01-12')
INSERT INTO Attendance
VALUES (39,'CC-4106',8,3,800022,'2016-01-12')
INSERT INTO Attendance
VALUES (40,'CC-4107',8,3,800022,'2016-01-12')
INSERT INTO Attendance
VALUES (41,'CC-4110',8,3,800022,'2016-01-12')
----------------------------------------------------------
--1)Студенти - групи
CREATE VIEW StudentsGroup
AS
SELECT CreditBookNumber, PersonalInfo, GroupName FROM Students join Groups A ON GroupsID=A.ID

--2)ПІБ студентів, які пропустили лабораторні роботи з предмету ХХ

USE Deanery
GO
CREATE PROC AttendanceLab
@ObjectName varchar(35)
AS
IF EXISTS(Select * from Subjects
WHERE ObjectName=@ObjectName)
  IF EXISTS(Select * from Subjects A join Attendance ON A.ID=SubjectsID
  WHERE ObjectName=@ObjectName)
  SELECT PersonalInfo, LessonDate FROM Students join Attendance ON CreditBookNumber=StudentsID join Subjects A ON SubjectsID=A.ID 
  WHERE ObjectName=@ObjectName AND TypeOfClassesID=3
  ELSE
    PRINT 'Пропусков лабораторных работ по этому предмету не найдено!'
ELSE
  PRINT 'Этого предмета нет в базе данных'

exec AttendanceLab 'Physics'
--3)Табель відвідуваності по предмету УУ в групі УУ за осінній семестр
USE Deanery
GO
CREATE PROC TabelAutumn
@ObjectName varchar(35),
@GroupName varchar(6)
AS
IF EXISTS(Select * from Subjects 
WHERE ObjectName=@ObjectName)
  IF EXISTS(Select * from Groups 
  WHERE GroupName=@GroupName)
      select PersonalInfo, count(StudentsID) as [Количество Пропусков] from Students join Attendance ON CreditBookNumber=StudentsID 
      join Subjects A ON SubjectsID=A.ID join Groups B ON GroupsID=B.ID
      where GroupName=@GroupName AND ObjectName=@ObjectName AND DATEPART(mm,LessonDate)>='09' AND DATEPART(mm,LessonDate)<='12'
      group by PersonalInfo 
      having count(StudentsID) IN (select count(StudentsID) from Attendance
      group by StudentsID) 
  ELSE 
    PRINT 'Этой групы нет в базе данных!'
ELSE
  PRINT 'Этого предмета нет в базе данных!'

exec TabelAutumn 'Physics', 'AA-42'
--4)Кількість прогульників у групі ХХ за січень;
CREATE VIEW AttendanceOtchet
AS
SELECT CreditBookNumber, PersonalInfo, GroupName, ObjectName, TypeName, TeachersID, LessonDate 
FROM Students join Attendance ON CreditBookNumber=StudentsID join Groups G ON GroupsID=G.ID join Subjects S ON SubjectsID=S.ID
join TypeOfClasses T ON TypeOfClassesID=T.ID

select * from AttendanceOtchet
--------------------------------------------------
CREATE PROC ZADANIYA4
@GroupName varchar(6)
AS
IF EXISTS(Select * from Groups WHERE GroupName=@GroupName)
  select COUNT(*) AS [Количество прогульщиков за январь] FROM (Select PersonalInfo, COUNT(PersonalInfo) AS [Количество прогулов] 
  From AttendanceOtchet A
  where EXISTS (Select PersonalInfo from AttendanceOtchet B
  WHERE A.PersonalInfo=B.PersonalInfo) AND GroupName=@GroupName AND DATEPART(mm,LessonDate)='01'
  GROUP BY PersonalInfo) AS Tab
ELSE 
    PRINT 'Этой групы нет в базе данных!'

exec ZADANIYA4 'AA-42'
--5)Сумарне число пропусків занять по групах і предметів.
CREATE PROC CountProgulov
@GroupName varchar(6),
@ObjectName varchar(35)
AS
IF EXISTS(Select * from Groups WHERE GroupName=@GroupName)
  IF EXISTS(Select * from Subjects WHERE ObjectName=@ObjectName)
    select COUNT(*) AS [Количество прогульщиков по данному предмету] FROM (Select PersonalInfo, COUNT(PersonalInfo) AS [Количество прогулов] 
    From AttendanceOtchet A
    where EXISTS (Select PersonalInfo from AttendanceOtchet B
    WHERE A.PersonalInfo=B.PersonalInfo) AND GroupName=@GroupName AND ObjectName=@ObjectName
    GROUP BY PersonalInfo) AS Tabl
  ELSE
    PRINT 'Этого предмета нет в базе данных!'
ELSE 
    PRINT 'Этой групы нет в базе данных!'

exec CountProgulov 'AA-42', 'Physics'

--6)Видалення даних за минулий навчальний рік;
use Deanery
go
CREATE TRIGGER ClearAttendance
ON Attendance
FOR DELETE
AS
DECLARE @DATE varchar(10)
SELECT @DATE=DATEPART(mm,GETDATE())
IF @DATE='07'
  BEGIN
    DELETE FROM Attendance WHERE ID IN (SELECT ID FROM DELETED)
	PRINT('Таблица успешно очищена.')
  END
ELSE 
  BEGIN
	RAISERROR('Учебный год ещё не закончен', 16, 1)
	ROLLBACK TRAN
  END

--7)Табель відвідуваності за семестр - угруповання з предметів і групам; підсумок - сумарне число пропусків;
CREATE VIEW SumProgul
AS
Select GroupName, ObjectName, COUNT(*) AS [Суммарное число прогулов] From AttendanceOtchet
GROUP BY GroupName, ObjectName
HAVING COUNT(*) IN (Select COUNT(PersonalInfo) AS [Количество прогулов] 
From AttendanceOtchet A
where EXISTS (Select PersonalInfo from AttendanceOtchet B
WHERE A.PersonalInfo=B.PersonalInfo)
GROUP BY GroupName, ObjectName)

	select * from SumProgul
--8)Повідомлення кожному студенту - прогульникові про явку в деканат.
CREATE PROC TIZVEZDA
@PersonalInfo varchar(50)
AS
IF EXISTS(Select * from Students WHERE PersonalInfo=@PersonalInfo)
  IF EXISTS(Select * from AttendanceOtchet WHERE PersonalInfo=@PersonalInfo)
    PRINT 'Вас ждут в деканате!!!'
  ELSE
    PRINT 'Все хорошо.'
ELSE
  PRINT 'В базе данных нету студента с таким именем.'

exec TIZVEZDA 'Misha Klimchuk'
exec TIZVEZDA 'Kantidian Markov'

exec ZADANIYA4 'BB-31'

select * from Attendance