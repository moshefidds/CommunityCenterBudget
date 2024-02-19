use CommunityCenterDB
go
delete ExpenseLedger
go
insert ExpenseLedger(VendorName, VendorAddress, Cause, SubCause, PaymentAmount, PaymentDate, SatisfactionRate)
select 
    case when m.medal = 'gold' then concat('www.', m.FirstName, m.LastName, '.com')
         when m.medal = 'silver' then concat('www.', m.FirstName, m.LastName, '.net')
         when m.medal = 'bronze' and m.Season = 'summer' then concat(m.FirstName, ' ', m.LastName, ' & friends')
         when m.medal = 'bronze' and m.Season = 'winter' then concat(m.FirstName, ' ', m.LastName, ' company')
    end,
    m.OlympicLocation,
    m.Sport,
    concat(substring(m.Sport, 1, 5), ' - ', m.SportSubcategory),
    case when m.AgeofMedalist <= 20 then m.YearBorn * m.AgeofMedalist
         when m.AgeofMedalist >= 35 then m.YearBorn + m.OlympicYear
         else m.OlympicYear / m.AgeofMedalist
    end,
    datetimefromparts(m.OlympicYear, 01, len(m.LastName), m.AgeofMedalist/8, len(m.Sport), 52, len(m.FirstName + m.LastName + m.OlympicLocation) * 10),
--It makes more sense for table to have an int column and the desc computed off of that. However, for this data then I had to do the opposite to get the correct results.
    case when m.AgeofMedalist > 29 then 4
         when m.Medal = 'gold' then 1
         when m.Medal = 'silver' then 2
         when m.medal = 'bronze' then 3
    end 
from RecordKeeperDB.dbo.medalist m
