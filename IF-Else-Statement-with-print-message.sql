--Alert user if input doesn't match data in DB
Declare @Job nvarchar(30) = 'Derector';

--'Exists' returns true if data comes back. Returns false if no data comes back.
IF Exists (Select id from Job where description = @job)

Begin
	Print 'That job exists.'
End

Else

Begin
	Print 'That job does NOT exist.'
End