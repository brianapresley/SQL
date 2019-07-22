--Views are queries stored in a database with a given name

/*
Create VIEW Basic_PRS_VIEW as
	select R.ID, R.Description, P.Name, RL.Quantity, P.Price
		from Request R
		Join RequestLine RL
			on RL.RequestID = R.ID
		Join Product P
		on P.ID = RL.ProductID;
*/
Select * From Basic_PRS_VIEW;