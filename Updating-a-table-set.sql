-- To update a table set

Select * From Employee where Id = 29

update employee set
Lastname = 'Coyote', Firstname = 'Wyle E'
--DO NOT FORGET WHERE CLAUSE! OR ENTIRE RESULT SET WILL UPDATE
Where Lastname = 'Brown' and firstname = 'Charlie'

Select * From Employee where ID = 29