Select * from bnk_loan

Select Count(id) as Total_Loan_Application from bnk_loan

Select Count(id) as MTD_Loan_Application from bnk_loan
where MONTH(issue_date) = 12 AND
year(issue_date) = 2021

Select Count(id) as PMTD_Loan_Application from bnk_loan
where MONTH(issue_date) = 11 AND
year(issue_date) = 2021

Select SUM(loan_amount) as MTD_Total_funded_Amount from bnk_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

Select SUM(loan_amount) as PMTD_Total_funded_Amount from bnk_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT SUM(total_payment) as Total_Amount_received from bnk_loan

SELECT SUM(total_payment) as MTD_Total_Amount_received from bnk_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

SELECT SUM(total_payment) as MTD_Total_Amount_received from bnk_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT Round(AVG(int_rate),4)*100 as Avg_Interest_Rate From bnk_loan

SELECT Round(AVG(int_rate),4)*100 as MTD_Avg_Interest_Rate From bnk_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

SELECT Round(AVG(int_rate),4)*100 as MTD_Avg_Interest_Rate From bnk_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4)*100 as MTD_AVG_DTI from bnk_loan
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti),4)*100 as PMTD_AVG_DTI from bnk_loan
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

Select 
  loan_status,
  count(id) as loan_applications,
  sum(total_payment) as total_amount_received,
  sum(loan_amount) as total_funded_amount,
  avg(int_rate * 100) as Interest_Rate,
  avg(dti * 100) as DTI
from bnk_loan 
group by loan_status

select 
 (COUNT(CASE when loan_status = 'Fully Paid' or loan_status = 'Current' Then id end)*100)
 /
 COUNT(id) as Good_Loan_percentage
 from bnk_loan

SELECT COUNT(id) as Good_Loan_Application from bnk_loan
where loan_status = 'Fully Paid' or loan_status = 'Current'

Select Sum(Loan_amount) as Good_Loan_Funded_Amount from bnk_loan
where loan_status in ('Fully Paid','Current' )

Select Sum(total_payment) as Good_Loan_Received_Amount from bnk_loan
where loan_status in ('Fully Paid','Current')

select 
 (COUNT(CASE when loan_status = 'Charged off' Then id end)*100.0)
 /
 COUNT(id) as Bad_Loan_percentage
 from bnk_loan 

select COUNT(id) as Bad_loan_Applications from bnk_loan
where loan_status = 'Charged off'

select sum(loan_amount) as Bad_loan_funded_Amount from bnk_loan
where loan_status = 'Charged off'

select sum(total_payment) as Bad_loan_received_Amount from bnk_loan
where loan_status = 'Charged off'

Select 
  loan_status,
  count(id) as MTD_loan_applications,
  sum(total_payment) as MTD_total_amount_received,
  sum(loan_amount) as MTD_total_funded_amount,
  avg(int_rate * 100) as Interest_Rate,
  avg(dti * 100) as DTI
from bnk_loan 
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021
group by loan_status

Select 
  loan_status,
  count(id) as PMTD_loan_applications,
  sum(total_payment) as PMTD_total_amount_received,
  sum(loan_amount) as PMTD_total_funded_amount,
  avg(int_rate * 100) as Interest_Rate,
  avg(dti * 100) as DTI
from bnk_loan 
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021
group by loan_status

SELECT 
       MONTH(issue_date),
	   DATENAME(MONTH, issue_date),
	   count(id) as total_loan_application,
	   sum(loan_amount) as total_funded_amount,
	   sum(total_payment) as total_received_amount
from bnk_loan
group by DATENAME(month, issue_date),MONTH(issue_date)
order by MONTH(issue_date)

SELECT 
       address_state,
	   count(id) as total_loan_application,
	   sum(loan_amount) as total_funded_amount,
	   sum(total_payment) as total_received_amount
from bnk_loan
group by address_state
order by count(id) desc

SELECT 
       term,
	   count(id) as total_loan_application,
	   sum(loan_amount) as total_funded_amount,
	   sum(total_payment) as total_received_amount
from bnk_loan
group by term
order by term

SELECT 
       emp_length,
	   count(id) as total_loan_application,
	   sum(loan_amount) as total_funded_amount,
	   sum(total_payment) as total_received_amount
from bnk_loan
group by emp_length
order by count(id) desc

SELECT 
       purpose,
	   count(id) as total_loan_application,
	   sum(loan_amount) as total_funded_amount,
	   sum(total_payment) as total_received_amount
from bnk_loan
group by purpose
order by count(id) desc

SELECT 
       home_ownership,
	   count(id) as total_loan_application,
	   sum(loan_amount) as total_funded_amount,
	   sum(total_payment) as total_received_amount
from bnk_loan
where grade = 'A' and address_state = 'CA'
group by home_ownership
order by count(id) desc

Select * from bnk_loan
where application_type = 'INDIVIDUAL'