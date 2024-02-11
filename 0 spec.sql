/*
I am a developer that developed many large developments. I’m currently developing a 55+ community with 9,000 units. 
At the center of it all, I’m developing a 28,000-sf community center with many amenities. 
My sales pitch in selling all 9,000 units depends on having a software that will keep track of the community center’s budget.

We would like to start with an expense ledger. 

We need to record the vender company name, vender address, cause, sub-cause, payment amount and payment date.

Additionally, we will need to keep track of the community’s satisfaction rate for each purchase. (I need the score and description in separate columns)
The following system will be used:
1 = Gold
2 = Silver
3 = Bronze
4 = Copper

Questions:
Q: Do you need the time of the recorded transaction?
A: Absolutely! We will need the milliseconds as well, as we plan on further developing this software with income and pledges. 

Q: Will any of the recorded transactions take place in the future?
A: we are not restricted either way.

Q: Would any of the sub-causes belong to multiple causes?
A: No.

Reports: 
1)	For corporate events, list all venders in the following format: vender, satisfaction score – satisfaction description, cause (sub-cause), $payment amount 
    (Target, 1 - gold, cause (sub-cause), $100.00). Show them with the most satisfactory on top.
2)	Show me the total, max, min, avg spent per cause each year. But only for the past 50 years. 
    Additionally, please leave out a cause totaling less than $100.
3)	Show me the same as two, for each sub-cause.
4)	Show me the number of expenses per year, per satisfaction, with the most recent on top.
5)	For internal use, show just the vender’s name, satisfaction score, satisfaction description with the least satisfactory on top.

Sample data:

Use the medalist table for sample data

Company Name: (Editor's note: Medals per medalist table)
    Gold – first name last name.com (displayed in typical web address format)
    Silver - first name last name.net (displayed in typical web address format)
    Bronze – for summer – “First name last name & friends”. For winter – “First name last name company”

Address: Olympic Location

Cause: Sport

Sub-cause: First five letters of the sport - Sport subcategory

Payment amount: 
    For medalists with age 20 and younger - year born times medalist age. 
    For medalists with age 35 and older - year born plus Olympic year. 
    For all other - Olympic year divided by medalist age.

Payment date: year – Olympic year, month – 01, day – length last name, hour – Medalist age divided by 8, minute – length of sport, seconds - 52, milliseconds – length of full name and olympic location times 10.

Satisfaction description: for all medalists under 29 - their Medal, all other - copper.

Good luck!!
*/

