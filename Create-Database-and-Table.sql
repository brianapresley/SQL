--To create a database
--create database BootcampDb;

--To create a table
/*
Create Table Students 
(
	ID int not null primary key identity(1, 1),
	FirstName nvarchar(30) not null, 
	LastName nvarchar(50) not null,
	Email nvarchar(255) null,
	Phone nvarchar(10) null,
	DateEnrolled DateTime not null default getdate() --puts timestamp on entry, user does not have to input this data
);

Insert into Students (FirstName, LastName)
	Values ('Jane', 'Doe');
*/--To Comment out the whole block of code /* to */

/*
Insert into Students (FirstName, LastName, Phone, Email)
	Values ('Alex', 'Chan', '5135605531', 'frozenchanana@gmail.com'), 
			('Brailee', 'Begley', '5134351173', 'brail33na11@gmail.com'),
			('Briana', 'Presley', '5132549807', 'presley.briana@gmail.com'),
			('Glenn', 'Lindmark', '5134849323', 'lindmark421@gmail.com'),
			('Jesse', 'Kyle', '5136551990', 'jkylecarpentry@gmail.com'),
			('Maggie', 'Schutzman', '8594797837', 'maggieschutzman2@gmail.com'),
			('Marianne', 'Linardos', '5137858178', 'mlinardos.edu@gmail.com'),
			('Titus', 'Moore', '9374741083', 'tmoore@edgewebware.com');


Select * from students 


--Create a new table with class identifiers that show which class (.Net or Java) each student was enrolled.

Create Table Class
(
	ID int not null primary key identity(1, 1),	
	Class nvarchar(80) not null
);


--To insert values into table

Insert into Class (Class) Values ('.Net'), ('Java');

--To view new entries in table
Select * from Class 

--To add a new column to a table with foreign key. Aways name foreign key (SourceTableNameID)
Alter Table Students
	Add ClassID int null --Allow it to be null when you first create it until you can assign data to it 
		foreign key references Class(ID); --Declare it as a FK and reference the Table where it is a PK



Select * from Students --To view new column



--Update ClassID field for line 1 to display Java

Update Students
	Set ClassID = 2
		Where FirstName = 'Jane'

--Update ClassID for rest of the students
Update Students
	Set ClassID = 1
	Where LastName <> 'Doe'

Select * from Students


--Create another table for assessments to include Technology and number of questions

Create Table Assessments
(
	ID int not null primary key identity(1, 1),
	Technology nvarchar(50) not null, 
	TotalQuestions int not null,

);


Insert into Assessments(Technology, TotalQuestions)
	Values ('GIT', '5'),
			('SQL', '10'),
			('C#', '10'),
			('JavaScript', '10'),
			('Angular', '10');



Select * from students;
Select * from Class;
Select * from Assessments;



--Create another table to include Student Assessment Scores that references Students
Create Table AssessmentScores
(
	ID int not null primary key identity(1, 1),
	--Add the first Foreign Key from 
	StudentID int not null foreign key references Students(ID),
	AssessmentID int not null foreign key references Assessments(ID),
	NbrCorrect int not null
);

Select * from students;
Select * from Class;
Select * from Assessments;
Select * from AssessmentScores;


--To assign scores for assessments for one student
Insert into AssessmentScores (StudentID, AssessmentID, NbrCorrect) 
	Values (1, 1, 6), --GIT
			(1, 2, 9), --SQL
			(1, 3, 10), --C#/Java
			(1, 4, 7), --JS
			(1, 5, 11); --Angular


--To Join all 3 tables and pull data for one student
Select *
	from Students s
	Join AssessmentScores sc
		On  s.ID = sc.StudentID
	Join Assessments a
		On a.ID = sc.AssessmentID
	Join Class c
		On c.ID = s.ClassID

Where s.ID = 1;



--To remove unwanted columns and to rearrange/rename columns

Select CONCAT(Lastname, ', ', Firstname) as 'Name', Class as 'Bootcamp', 
				Technology as 'Assessment', NbrCorrect, TotalQuestions, 
				--To combine the number correct and total questions and convert them to a percent
				--CAST takes one data type and displays it as a different type
				CAST(((CAST(NbrCorrect as decimal) / CAST(TotalQuestions as decimal)) * 100) as int) as 'Score'
	from Students s
	Join AssessmentScores sc
		On  s.ID = sc.StudentID
	Join Assessments a
		On a.ID = sc.AssessmentID
	Join Class c
		On c.ID = s.ClassID
Where s.Id = 1;

*/