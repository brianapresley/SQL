--  Second step Then Create View
Create View RequestsForUsers As
-- First step! Create a query statement that shows all requests for one user
-- Where the R.ID matches the U.ID

Select U.ID, U.Username, Concat(u.Firstname, ' ', u.Lastname) as 'Name',
		R.ID as 'Request ID', R.Description
	From Users U
	Join Request R 
		on R.UserID = U.ID;

Select * From RequestsForUsers;
	 