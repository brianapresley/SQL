--Looping searching thru a list of data and checking if conditions apply
--Repeating until "While clause" returns false
--To calulate the sum of numbers 1-15 and display the answer in a print message
Declare @Index int = 0;
Declare @sum int = 0;

While @index <= 15 --While sets the conditions for list of data 
Begin
	Set @sum = @sum + @Index;
	Set @Index = @Index + 1;
End
Print 'The sum of 1 to 15 is ' + CAST(@sum as nvarchar(10)) --Cast converts data types since print message can only be a string and not int 