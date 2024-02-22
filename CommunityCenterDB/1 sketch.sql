/*
CommunityCenterDB
ExpenseLedger
	VendorName varchar(30) not null not blank
	VendorAddress varchar(30) not null not blank
	Cause varchar(50) not null not blank
	Sub-Cause varchar(20) not null not blank
	PaymentAmount decimal (10, 2) not null
	PaymentDate date not null 
	SatisfactionRate int not null must be between 1 and 4
	SatisfactionRateDesc computed off of int column
	unique cause and subcause together
*/

