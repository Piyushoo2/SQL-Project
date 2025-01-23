select * from Bank_Loan

select count(ID) as Total_Application from Bank_Loan

select count(ID) as Total_MTD_Application from Bank_Loan where MONTH(Issue_Date) = 12

select count(ID) as Total_PMTD_Application from Bank_Loan where MONTH(Issue_Date) = 11

select sum(Loan_Amount) as Total_Funded_Amount from Bank_Loan

select sum(Loan_Amount) as Total_Funded_Amount from Bank_Loan where month(issue_date) = 12

select sum(Loan_Amount) as Total_PMTD_Funded_Amount from Bank_Loan where month(issue_date) = 11

select sum(Total_Payment) as Total_Amt_Collect from Bank_Loan

select sum(Total_Payment) as Total_MTD_Amt_Collect from Bank_Loan WHERE MONTH(Issue_Date) = 12

select sum(Total_Payment) as Total_PMTD_Amt_Collect from Bank_Loan WHERE MONTH(Issue_Date) = 11

select AVG(Int_Rate)*100 as Avg_Int_Rate from Bank_Loan

select AVG(Int_Rate)*100 as Avg_MTD_Int_Rate from Bank_Loan where month(issue_date) = 12

select AVG(Int_Rate)*100 as Avg_PMTD_Int_Rate from Bank_Loan where month(issue_date) = 11

select AVG(Dti)*100 as Avg_Dti from Bank_Loan

select avg(dti)*100 as MTD_Avg_Dti from Bank_Loan where month(issue_date) = 12

select avg(dti)*100 as PMTD_Avg_Dti from Bank_Loan where month(issue_date) = 11

select (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end)*100.0)/ count(id) as Good_Loan_Percentage from Bank_Loan

select count(id) as Good_loan_application from Bank_Loan where loan_status = 'fully paid' or Loan_Status = 'current'

select sum(loan_amount) as Good_loan_funded_amount from Bank_Loan where Loan_Status = 'fully paid' or Loan_Status = 'current'

select sum(Total_payment) as Good_loan_amount_received from Bank_Loan where Loan_Status = 'fully paid' or Loan_Status = 'current'

select (COUNT(case when loan_status = 'charged off' then id end)*100.0)/ 
count(id) as Bad_Loan_percentage from Bank_Loan

select count(id) as Bad_loan_application from Bank_Loan where Loan_Status = 'Charged off'

select sum(Loan_Amount) as Bad_loan_funded_amount from Bank_Loan where Loan_Status = 'charged off'

select sum(total_payment) as Bad_loan_amount_received from Bank_Loan where Loan_Status = 'charged off'

select 
loan_status,COUNT(id) as loan_count,
	sum(loan_amount) as total_loan_funded,
	sum(total_payment) as total_loan_received,
	avg(int_rate *100) as Interest_rate,
	avg(dti * 100) as DTI
	from Bank_Loan
		group by Loan_Status


SELECT Loan_status,
sum(loan_amount) as MTD_Total_loan_funded,
sum(total_payment) as MTD_Total_loan_received
from Bank_Loan
where MONTH(issue_date) = 12
 group by Loan_Status


 select month(issue_date) as Month_Number,
		DATENAME(month,issue_date) as Month_Number,
		count(id) as Total_Loan_Application,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by month(issue_date), datename(month,issue_date)
		order by month(issue_date)

select address_state as State,
		count(id) as Total_Loan_Application,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from bank_loan
		group by address_state
		order by Address_State


select term as Term,
		count(id) as Total_Loan_Application,
		sum(loan_amount) as Total_Loan_Application,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by Term
		order by Term


select Emp_length as Employee_Lenth,
		COUNT(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by Emp_Length
		order by Emp_Length

select purpose as Purpose,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from bank_loan
		group by purpose
		order by purpose

select home_ownership as Home_Ownership,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Loan_Application,
		sum(total_payment) as Total_Amount_Received
		from Bank_Loan
		group by Home_Ownership
		order by Home_Ownership



select purpose as Purpose,
		count(id) as Total_Loan_Applications,
		sum(loan_amount) as Total_Funded_Amount,
		sum(total_payment) as Total_Amount_Received
		from bank_loan
		where Grade = 'A'
		group by purpose
		order by purpose

select grade as Grade,
COUNT(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from Bank_Loan
group by Grade
order by Grade

select Sub_Grade as Sub_Grade,
COUNT(id) as Total_Loan_App,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from Bank_Loan
group by Sub_Grade
order by Sub_Grade