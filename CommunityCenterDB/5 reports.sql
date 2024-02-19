--1)	For corporate events, list all venders in the following format: vender, satisfaction score – satisfaction description, cause (sub-cause), $payment amount 
    --(Target, 1 - gold, cause (sub-cause), $100.00). Show them with the most satisfactory on top.
select Vendors = concat('(', e.VendorName, ', ', e.SatisfactionRate, ' - ', e.SatisfactionDesc, ', ', e.Cause, ' (', e.SubCause, '), $', e.PaymentAmount, ')')
from ExpenseLedger e
order by e.SatisfactionRate 

--2)	Show me the total, max, min, avg spent per cause each year. But only for the past 50 years. 
   -- Additionally, please leave out a cause totaling less than $100.
select TotalCost = sum(e.PaymentAmount), MaxCost = max(e.PaymentAmount), MinCost = min(e.PaymentAmount), AvgCost = avg(e.PaymentAmount), e.Cause, Year = year(e.PaymentDate)
from ExpenseLedger e 
where  year(getdate()) - year(e.PaymentDate) <= 50
group by e.Cause, year(e.PaymentDate) 
having sum(e.PaymentAmount) > 100

--3)	Show me the same as two, for each sub-cause.
select TotalCost = sum(e.PaymentAmount), MaxCost = max(e.PaymentAmount), MinCost = min(e.PaymentAmount), AvgCost = avg(e.PaymentAmount), e.SubCause, Year = year(e.PaymentDate)
from ExpenseLedger e 
where  year(getdate()) - year(e.PaymentDate) <= 50
group by e.SubCause, year(e.PaymentDate) 
having sum(e.PaymentAmount) > 100


--4)	Show me the number of expenses per year, per satisfaction, with the most recent on top.
select NumOfExpenses = count(*), Year = year(e.PaymentDate), Satisfaction = e.SatisfactionDesc
from ExpenseLedger e
group by year(e.PaymentDate), e.SatisfactionDesc
order by Year desc
--5)	For internal use, show just the vender’s name, satisfaction score, satisfaction description with the least satisfactory on top.
select e.VendorName, e.SatisfactionRate, e.SatisfactionDesc
from ExpenseLedger e 
order by e.SatisfactionRate desc