use CommunityCenterDB
go
drop table if exists ExpenseLedger 
go

create table dbo.ExpenseLedger(
	ExpenseLedgerId int not null identity primary key,
	VendorName varchar(40) not null constraint ck_ExpenseLedger_VendorName_cannot_be_blank check(VendorName <> ''),
	VendorAddress varchar(40) not null constraint ck_ExpenseLedger_VendorAddress_cannot_be_blank check(VendorAddress <> ''),
	Cause varchar(50) not null constraint ck_ExpenseLedger_Cause_cannot_be_blank check(Cause <> ''),
	SubCause varchar(50) not null constraint ck_ExpenseLedger_SubCause_cannot_be_blank check(SubCause <> ''),
	PaymentAmount decimal(10,2) not null constraint ck_ExpenseLedger_PaymentAmount_must_be_greater_than_0 check(PaymentAmount > 0),
	PaymentDate datetime not null,
--AS I wasn't sure if you wanted a separate date for the recorded transaction or that was the PaymentDate.
    SatisfactionRate int not null constraint ck_ExpenseLedger_SatisfactionRate_must_be_between_1_and_4 check(SatisfactionRate between 1 and 4),
	SatisfactionDesc as case SatisfactionRate when 1 then 'Gold' when 2 then 'Silver' when 3 then 'Bronze' when 4 then 'Copper' end persisted,
    constraint ck_ExpenseLedger_SubCause_must_match_up_with_Cause check(substring(SubCause, 1, 5) = substring(Cause, 1, 5)))
go
